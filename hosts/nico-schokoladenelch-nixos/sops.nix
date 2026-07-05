_: {
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = "/mnt/bucket/persist/var/lib/sops-nix/key.txt";
      sshKeyPaths = [];
    };
    validateSopsFiles = true;
    secrets = {
      "cloudflare-ddns-token" = {
        mode = "0444";
      };
      "cloudflare-tunnel-token" = {
        owner = "cloudflared";
        group = "cloudflared";
        mode = "0440";
      };
      "msmtp-password" = {
        mode = "0444";
      };
      "user-password" = {
        neededForUsers = true;
      };
      "root-password" = {
        neededForUsers = true;
      };
    };
  };
}
