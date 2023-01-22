{ config, pkgs, lib, ... }: {

	networking = {

		hostName       = "prometheus";
		networkmanager = {
			enable    = true;
			unmanaged = [ "interface-name:ve-*" ];
		};

		interfaces = {
			"lan" = {
				useDHCP = lib.mkDefault true;
			};
			"lan-usb" = {
				useDHCP = lib.mkDefault true;
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
		# networking.interfaces.eno1.useDHCP = lib.mkDefault true;

	};

	# Rename network interfaces
	systemd.network.links = {

		"lan" = {
			matchConfig.PermanentMACAddress = "60:a4:4c:54:8f:ed";
			linkConfig.Name = "lan";
		};

		"lan-usb" = {
			matchConfig.PermanentMACAddress = "0c:37:96:4b:7b:48";
			linkConfig.Name = "lan-usb";
		};

	};

}
