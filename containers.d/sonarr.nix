{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.sonarr ];
	services.sonarr = {
		enable       = true;
		openFirewall = true;
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/sonarr" = {
				};
			};
		};
	};

}
