{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.jellyfin ];
	services.jellyfin = {
		enable       = true;
		openFirewall = true;
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/jellyfin" = {
				};
			};
		};
	};

}
