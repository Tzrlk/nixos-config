{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.lidarr ];
	services.lidarr = {
		enable       = true;
		openFirewall = true;
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/lidarr" = {
				};
			};
		};
	};

}
