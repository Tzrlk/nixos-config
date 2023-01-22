{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
    ( modulesPath + "/installer/scan/not-detected.nix" )
  ];

  fileSystems = {
    "/"     = { device = "/dev/disk/by-label/nixos";    fsType = "ext4"; };
    "/boot" = { device = "/dev/disk/by-uuid/D07D-AC98"; fsType = "vfat"; };
  };
  swapDevices = [
    { device = "/dev/disk/by-uuid/9c1380f6-78d5-4fdc-af6d-103d16bbea20"; }
  ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # high-resolution display
  hardware.video.hidpi.enable = lib.mkDefault true;

}
