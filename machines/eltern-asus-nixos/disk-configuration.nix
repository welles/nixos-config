{
  disko.devices = {
    disk = {
      vda = {
        type = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {
            boot = {
              priority = 1;
              name = "boot";
              start = "0";
              end = "1G";
              type = "EF02";
            };
            swap = {
              priority = 2;
              size = "8G";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };
            root = {
              priority = 3;
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
