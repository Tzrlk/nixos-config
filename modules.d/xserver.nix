{ config, pkgs, lib, ... }: {

	environment.systemPackages = with pkgs; [
		displaylink
		microsoft-edge
	];

	services.xserver = {
		enable = true;
		layout = "us";
		displayManager.gdm.enable   = true;
		desktopManager.gnome.enable = true;
		videoDrivers = [
			"displaylink"
			"modesetting"
		];
	};

}
