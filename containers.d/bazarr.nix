{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.bazarr ];
	services.bazarr = {
		enable       = true;
		openFirewall = true;
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/bazarr" = {
				};
			};
		};
	};

}
