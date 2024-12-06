{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.prowlarr ];

	services.prowlarr = {
		enable       = true;
		openFirewall = true;
	};

	users.users."sonarr".extraGroups = [ "users" ];

	systemd.services.prowlarr.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				# https://wiki.servarr.com/prowlarr/installation#nginx
				"/prowlarr" = {
					proxyPass = "http://localhost:9696/prowlarr";
					extraConfig = ''
						proxy_set_header Upgrade    $http_upgrade;
						proxy_set_header Connection $http_connection;
					'';
				};
			};
		};
	};

}
