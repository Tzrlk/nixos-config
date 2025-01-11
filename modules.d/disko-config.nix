{
  disko.devices = {
    disk = {

      main = {
        type   = "disk";
        device = "/dev/sda";
        content = {
          type = "gpt";
          partitions = {

            ESP = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            swap = {
              size = "8000M";
              type = "swap";
              content = {
                type = "swap";
              };
            };

            root = {
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

      data = {
        type = "disk";
        device = "/dev/sdb";
        content = {
          type = "gpt";
          partitions = {

            data = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/data";
              };
            };

          };
        };
      };

    };
  };
}
