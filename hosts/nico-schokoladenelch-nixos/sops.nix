_: {
  sops = {
    defaultSopsFile = ./secrets.yaml;
    defaultSopsFormat = "yaml";
    age.sshKeyPaths = [];
    validateSopsFiles = true;
    secrets = {
      "cloudflare-ddns-token" = {
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
