{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.jellyfin ];

	services.jellyfin = {
		enable       = true;
		openFirewall = true;
	};

	users.users."jellyfin".extraGroups = [
		"users"
		"aria2"
		"sonarr"
		"radarr"
		"lidarr"
	];

	systemd.services.jellyfin.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				# https://jellyfin.org/docs/general/networking/nginx
#				"/jellyfin" = {
#					extraConfig = ''
#						return 302 $scheme://$host/jellyfin/;
#					'';
#				};
				"/jellyfin" = {
					proxyPass = "http://127.0.0.1:8096/jellyfin";
					extraConfig = ''
						proxy_buffering off;
					'';
				};
#				"/jellyfin/web" = {
#					proxyPass = "http://localhost:8096/web/index.html";
#				};
				"/jellyfin/socket" = {
					proxyPass = "http://localhost:8096/jellyfin";
				};
			};
		};
	};

}
