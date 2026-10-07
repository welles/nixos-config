{sopsAgeKeyFile, ...}: {
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age = {
      keyFile = sopsAgeKeyFile;
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
      # Private SSH key the devbox container uses for GitHub (devbox.nix)
      "devbox-github-ssh-key" = {
        restartUnits = ["devbox-secrets.service"];
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
