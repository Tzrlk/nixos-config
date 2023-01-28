{ config, lib, pkgs, modulesPath, ... }: {
	nixpkgs.config.allowUnfree = true;

	imports = [
		( modulesPath + "/installer/scan/not-detected.nix" )
	];

	fileSystems = {
		"/"     = { device = "/dev/disk/by-label/nixos"; fsType = "ext4"; };
		"/boot" = { device = "/dev/disk/by-label/boot";  fsType = "vfat"; };
		"/data" = { device = "/dev/disk/by-label/data";  fsType = "ext4"; };
	};
	swapDevices = [
		{ device = "/dev/disk/by-label/swap"; }
	];

	hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

	# high-resolution display
	hardware.video.hidpi.enable = lib.mkDefault true;

	# NVIDIA drivers are unfree.
	hardware.opengl.enable        = true;
	hardware.nvidia.package       = config.boot.kernelPackages.nvidiaPackages.stable;
	services.xserver.videoDrivers = [ "nvidia" ];

}
