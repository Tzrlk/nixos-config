{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.radarr ];
	services.radarr = {
		enable       = true;
		openFirewall = true;
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/radarr" = {
				};
			};
		};
	};

}
