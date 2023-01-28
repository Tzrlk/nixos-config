{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.komga ];
	services.komga = {
		enable       = true;
		openFirewall = true;
	};

	systemd.services.komga.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/komga" = {
					proxyPass = "http://localhost:8080";
				};
			};
		};
	};

}
