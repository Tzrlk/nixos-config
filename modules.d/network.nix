{ config, pkgs, lib, ... }: {

#	services.openssh = {
#		enable = true;
#		permitRootLogin = "no";
#	};

	networking = {
		defaultGateway = "192.168.1.254";
		nameservers    = [ "192.168.1.254" ];
		domain         = "home";

		hostName       = "prometheus";
		search         = [ "home" ];
		networkmanager = {
			enable    = true;
			unmanaged = [
				"interface-name:ve-*"
				"interface-name:cni-*"
			];
		};

		firewall = {
			enable = true;
		};

		interfaces = {
			"eno1" = {
				useDHCP = true;
			};
			"enp0s29u1u6u1i5" = {
				useDHCP = false;
			};
		};

		nat = {
			enable = true;
			externalInterface = "eno1";
		};

		# Enables DHCP on each ethernet and wireless interface. In case of scripted networking
		# (the default) this is the recommended approach. When using systemd-networkd it's
		# still possible to use this option, but it's recommended to use it in conjunction
		# with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
		useDHCP = lib.mkDefault true;

	};

}
