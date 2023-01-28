{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.bazarr ];

	services.bazarr = {
		enable       = true;
		openFirewall = true;
	};

	users.users."bazarr".extraGroups = [ "users" ];

	systemd.services.bazarr.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/bazarr" = {
					proxyPass = "http://127.0.0.1:6767/bazarr";
				};
			};
		};
	};

}
