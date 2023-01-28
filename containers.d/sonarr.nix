{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.sonarr ];

	services.sonarr = {
		enable       = true;
		openFirewall = true;
	};

	users.users."sonarr".extraGroups = [ "users" ];

	systemd.services.sonarr.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				# https://wiki.servarr.com/sonarr/installation#nginx
				"/sonarr" = {
					proxyPass = "http://127.0.0.1:8989/sonarr";
					extraConfig = ''
						proxy_set_header Upgrade    $http_upgrade;
						proxy_set_header Connection $http_connection;
					'';
				};
			};
		};
	};

}
