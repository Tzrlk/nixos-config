{ config, pkgs, ... }: {

	services.xserver = {
		enable = true;
		layout = "us";
		displayManager.gdm.enable   = true;
		desktopManager.gnome.enable = true;
#		videoDrivers = [ "nvidia" ];
	};

}