{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.komga ];
	services.komga = {
		enable = true;
	};
	# TODO: create application.yml at /config

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/komga" = {
				};
			};
		};
	};

}
