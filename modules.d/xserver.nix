{ config, pkgs, lib, ... }: {

	environment.systemPackages = with pkgs; [
		autorandr
		displaylink
		microsoft-edge
		uget
		uget-integrator
	];

	services.xserver = {
		enable = true;
		layout = "us";
		displayManager = {
			gdm.enable = true;
			sessionCommands = ""
				+ "${lib.getBin pkgs.xorg.xrandr}/bin/xrandr"
					+ " --setprovideroutputsource 1 0"
					+ " --setprovideroutputsource 2 0"
					+ "\n"
				+ "${lib.getBin pkgs.autorandr}/bin/autorandr --change";
#			> xrandr --listproviders
#			Providers: number : 3
#            Provider 0: id: 0x1b8 cap: 0x1, Source Output crtcs: 4 outputs: 9 associated providers: 2 name:NVIDIA-0
#            Provider 1: id: 0x2d9 cap: 0x2, Sink Output crtcs: 1 outputs: 1 associated providers: 1 name:modesetting
#            Provider 2: id: 0x1f0 cap: 0x2, Sink Output crtcs: 1 outputs: 1 associated providers: 1 name:modesetting
#			> xrandr --listmonitors
#			Monitors: 2
#			 0: +*DVI-I-1-1 2560/598x1440/336+0+320  DVI-I-1-1
#			 1: +DVI-I-2-2 1080/598x1920/337+2560+0  DVI-I-2-2

		};
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
