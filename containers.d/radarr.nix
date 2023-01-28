{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.radarr ];

	services.radarr = {
		enable       = true;
		openFirewall = true;
	};

	users.users."radarr".extraGroups = [ "users" ];

	systemd.services.radarr.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				# https://wiki.servarr.com/radarr/installation#nginx
				"/radarr" = {
					proxyPass = "http://localhost:7878/radarr";
					extraConfig = ''
						proxy_set_header Upgrade    $http_upgrade;
						proxy_set_header Connection $http_connection;
					'';
				};
			};
		};
	};

}
