{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.jackett ];
	services.jackett = {
		enable       = true;
		openFirewall = true;
	};

	users.users."jackett".extraGroups = [ "users" ];

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/jackett" = {
					proxyPass = "http://127.0.0.1:9117";
				};
			};
		};
	};

}
