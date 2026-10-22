# Unlocks KWallet with the login password from sops, for Plasma hosts with
# autologin (autologin.nix), where no password is typed that pam_kwallet could
# use. The password is the plaintext user-password (user-password-plaintext.nix),
# so the wallet keeps the login password as its password.
#
# Does what pam_kwallet does at a password login, split in two:
#   - kwallet-sops-key (root, before the display manager) derives the key from
#     the password and ~/.local/share/kwalletd/kdewallet.salt (PBKDF2-SHA512,
#     creating the salt if it is missing) into /run/kwallet-sops-key/key,
#     readable by the user. The user's processes only get the key, never the
#     login password.
#   - kwallet-sops-unlock (user, at session start) starts
#     `ksecretd --pam-login` and hands it the key and the session environment.
#     ksecretd replaces an instance that D-Bus started earlier.
# A missing wallet is created with the login password; an existing one has to
# use it too (KWallet Manager → Change Password).
#
# The wallet is protected no better than the disk the age key lies on.
{
  config,
  pkgs,
  user,
  ...
}: let
  home = config.users.users.${user}.home;
  keyDir = "/run/kwallet-sops-key";

  deriveKey = pkgs.writers.writePython3 "kwallet-sops-key" {} ''
    import hashlib
    import os
    import pwd
    import sys

    password_file, user, key_dir = sys.argv[1:4]

    # Same constants and salt file as pam_kwallet
    keysize = 56
    iterations = 50000
    account = pwd.getpwnam(user)
    wallet_dir = os.path.join(account.pw_dir, ".local/share/kwalletd")
    salt_file = os.path.join(wallet_dir, "kdewallet.salt")

    # Only the password is read as root; the home directory and the key are
    # touched as the user, so links there can't redirect root's writes
    with open(password_file, "rb") as f:
        password = f.read().rstrip(b"\n")
    os.chown(key_dir, account.pw_uid, account.pw_gid)
    os.setgroups([])
    os.setgid(account.pw_gid)
    os.setuid(account.pw_uid)
    os.umask(0o077)

    os.makedirs(wallet_dir, exist_ok=True)
    if not os.path.exists(salt_file):
        with open(salt_file, "wb") as f:
            f.write(os.urandom(keysize))
    with open(salt_file, "rb") as f:
        salt = f.read(keysize)
    key = hashlib.pbkdf2_hmac("sha512", password, salt, iterations, keysize)

    with open(os.path.join(key_dir, "key"), "wb") as f:
        f.write(key)
  '';

  unlock = pkgs.writers.writePython3 "kwallet-sops-unlock" {} ''
    import os
    import socket
    import subprocess
    import sys

    key_file, ksecretd = sys.argv[1:3]

    with open(key_file, "rb") as f:
        key = f.read()

    # ksecretd reads the key from a pipe, then waits for the environment on
    # a listening socket
    socket_path = os.path.join(
        os.environ["XDG_RUNTIME_DIR"], "kwallet-sops-unlock.socket")
    if os.path.exists(socket_path):
        os.unlink(socket_path)
    listener = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
    listener.bind(socket_path)
    listener.listen(1)
    key_read, key_write = os.pipe()

    env = dict(os.environ, PAM_KWALLET5_LOGIN=socket_path)
    daemon = subprocess.Popen(
        [ksecretd, "--pam-login", str(key_read), str(listener.fileno())],
        env=env,
        pass_fds=(key_read, listener.fileno()),
    )
    os.close(key_read)
    listener.close()
    os.write(key_write, key)
    os.close(key_write)

    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
        client.connect(socket_path)
        client.sendall(
            "".join(f"{k}={v}\n" for k, v in os.environ.items()).encode())
    os.unlink(socket_path)

    # ksecretd stays the wallet daemon of the session
    sys.exit(daemon.wait())
  '';
in {
  imports = [./user-password-plaintext.nix];

  systemd.services.kwallet-sops-key = {
    description = "Derive the KWallet key from the login password";
    wantedBy = ["display-manager.service"];
    before = ["display-manager.service"];
    unitConfig.RequiresMountsFor = [home];
    serviceConfig = {
      Type = "oneshot";
      RemainAfterExit = true;
      RuntimeDirectory = "kwallet-sops-key";
      RuntimeDirectoryMode = "0700";
      ExecStart = "${deriveKey} ${config.sops.secrets."user-password".path} ${user} ${keyDir}";
    };
  };

  # Ordered like plasma-kwallet-pam.service, which does the same after a
  # password login
  systemd.user.services.kwallet-sops-unlock = {
    description = "Unlock KWallet with the login password from sops";
    partOf = ["graphical-session.target"];
    wantedBy = ["graphical-session.target"];
    before = ["plasma-plasmashell.service" "plasma-kded6.service"];
    after = ["plasma-kwin_wayland.service" "plasma-kcminit.service"];
    serviceConfig = {
      ExecStart = "${unlock} ${keyDir}/key ${pkgs.kdePackages.kwallet}/bin/ksecretd";
      Slice = "background.slice";
    };
  };
}
