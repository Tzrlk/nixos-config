{ config, pkgs, lib, ... }: {

	networking = {
		defaultGateway = "192.168.1.254";
		nameservers    = [ "192.168.1.254" ];
		domain         = "home";

		hostName       = "prometheus";
		search         = [ "home" ];
		networkmanager = {
			enable    = true;
			unmanaged = [ "interface-name:ve-*" ];
		};

		firewall = {
			enable = true;
		};

		interfaces = {
			"eno1" = {
				useDHCP = true;
			};
			"lan-usb" = {
				useDHCP = true;
			};
		};

		nat = {
			enable = true;
			externalInterface = "lan";
		};

		# Enables DHCP on each ethernet and wireless interface. In case of scripted networking
		# (the default) this is the recommended approach. When using systemd-networkd it's
		# still possible to use this option, but it's recommended to use it in conjunction
		# with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
		useDHCP = lib.mkDefault true;

	};

}
