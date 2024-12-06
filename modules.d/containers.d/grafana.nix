{ config, lib, pkgs, ... }: {

	environment.systemPackages = with pkgs; [
		grafana
		grafana-loki
	];

	services.grafana = {
		enable                = true;
		auth.disableLoginForm = true;
		port                  = 3000; # default
	};

	services.loki = {
#		enable = true;
	};

#	users.users."grafana".extraGroups = [
#		"users"
#	];

	#systemd.services.jellyfin.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/grafana" = {
					proxyPass = "http://127.0.0.1:3000/";
					extraConfig = ''
						rewrite ^/grafana/(.*) /$1 break;
					'';
				};
				"/grafana/api/live" = {
					proxyPass = "http://127.0.0.1:3000/";
					extraConfig = ''
						rewrite ^/grafana/(.*) /$1 break;
						proxy_set_header Upgrade    $http_upgrade;
						proxy_set_header Connection $connection_upgrade;
					'';
				};
			};
		};
	};

}
