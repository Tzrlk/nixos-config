{ config, pkgs, lib, ... }: {

	environment.systemPackages = with pkgs; [
	];

	services.samba-wsdd.enable = true; # make shares visible for windows 10 clients
	networking.firewall = {
		allowedTCPPorts = [ 5357 ]; # wsdd
		allowedUDPPorts = [ 3702 ]; # wsdd
	};

	services.samba = {
		enable       = true;
		securityType = "user";
		openFirewall = true;
		extraConfig  = ''
			workgroup     = HOME
			server string = prometheus
			netbios name  = prometheus
			security      = user
			#use sendfile = yes
			#max protocol = smb2
			# note: localhost is the ipv6 localhost ::1
			hosts allow   = 192.168.1. 127.0.0.1 localhost
			hosts deny    = 0.0.0.0/0
			guest account = nobody
			map to guest  = bad user
		'';
		shares = {
			media = {
				comment    = "Media library.";
				path       = "/data/media";
				browseable = "yes";
				readable   = "yes";
				writable   = "no";
				public     = "yes";
			};
		};
	};

}
