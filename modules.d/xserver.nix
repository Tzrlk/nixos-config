{ config, pkgs, lib, ... }: {

	environment.systemPackages = with pkgs; [
		displaylink
		microsoft-edge
		uget
		uget-integrator
	];

	services.xserver = {
		enable = true;
		layout = "us";
		displayManager.gdm.enable  = true;
		desktopManager.xfce.enable = true;
		videoDrivers = [
			"displaylink"
			"modesetting"
		];
	};

	# Disable the GNOME3/GDM auto-suspend feature that cannot be disabled in GUI!
	# If no user is logged in, the machine will power down after 20 minutes.
	systemd.targets = {
		sleep.enable = false;
		suspend.enable = false;
		hibernate.enable = false;
		hybrid-sleep.enable = false;
	};

}
