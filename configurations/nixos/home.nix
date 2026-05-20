# NixOS Home Manager Configuration
#
# Development environment for WSL. Imports shared shell, CLI tools,
# and Git modules. Overrides the Git email to use the work identity.
{
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home/shell.nix
    ../../modules/home/cli-tools.nix
    ../../modules/home/git.nix
    ../../modules/scripts/npm-global-install
  ];

  home = {
    # NPM Settings
    file.".npmrc".text = ''
      prefix=${config.home.homeDirectory}/.npm-global
      save-exact=true
      save-prefix=
    '';

    sessionPath = [
      "${config.home.homeDirectory}/.npm-global/bin"
      "${config.home.homeDirectory}/.dotnet/tools"
    ];

    sessionVariables = {
      SSL_CERT_DIR = "${config.home.homeDirectory}/.aspnet/dev-certs/trust:/etc/ssl/certs";
    };

    activation = {
      trustFirefoxDevCert = lib.hm.dag.entryAfter ["writeBoundary"] ''
        CERT_DIR="${config.home.homeDirectory}/.aspnet/dev-certs/trust"
        CERT_PATH="$CERT_DIR/localhost.pem"

        # 1. Check if the certificate file is missing
        if [ ! -f "$CERT_PATH" ]; then
          # Safeguard: Ensure the dotnet CLI is actually available in the environment
          if command -v dotnet >/dev/null 2>&1; then
            echo "ASP.NET dev cert not found. Auto-generating and exporting..."
            mkdir -p "$CERT_DIR"

            # Generates a local HTTPS cert if one doesn't exist yet
            dotnet dev-certs https
            # Exports it to our predictable path
            dotnet dev-certs https --export-path "$CERT_PATH" --format PEM --no-password
          else
            echo "Warning: $CERT_PATH not found, and 'dotnet' is not in PATH. Skipping auto-generation."
          fi
        fi

        # 2. Inject the certificate into Firefox profiles if it exists now
        if [ -f "$CERT_PATH" ]; then
          for profile_dir in ${config.home.homeDirectory}/.config/mozilla/firefox/*/; do
            if [ -d "$profile_dir" ] && [ -f "$profile_dir/cert9.db" ]; then
              echo "Injecting ASP.NET Core dev cert into Firefox profile: $(basename "$profile_dir")"
              ${pkgs.nss.tools}/bin/certutil -d sql:"$profile_dir" -A -t "P,," -n "localhost-dev" -i "$CERT_PATH"
            fi
          done
        fi
      '';
    };
  };

  # Override default git email with work identity
  programs.git.settings.user.email = lib.mkForce "welles@mentz.net";
}
