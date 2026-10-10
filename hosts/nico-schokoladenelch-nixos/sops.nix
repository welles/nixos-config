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
      # Private SSH key the devbox VM uses for GitHub (devbox.nix)
      "devbox-github-ssh-key" = {
        restartUnits = ["devbox-secrets.service"];
      };
      # Password hash of the devbox user `dev`, for the RDP login (devbox.nix)
      "devbox-user-password" = {
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
