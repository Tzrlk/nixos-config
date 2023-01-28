{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.lidarr ];

	services.lidarr = {
		enable       = true;
		openFirewall = true;
	};

	users.users."lidarr".extraGroups = [ "users" ];

	systemd.services.lidarr.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				# https://wiki.servarr.com/lidarr/installation#nginx
				"/lidarr" = {
					proxyPass = "http://localhost:8686/lidarr";
					extraConfig = ''
						proxy_set_header Upgrade    $http_upgrade;
						proxy_set_header Connection $http_connection;
					'';
				};
			};
		};
	};

}
