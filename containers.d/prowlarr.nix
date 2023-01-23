{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.prowlarr ];
	services.prowlarr = {
		enable       = true;
		openFirewall = true;
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/prowlarr" = {
					proxyPass = "http://127.0.0.1:9696";
					extraConfig = ''
						proxy_redirect     off;
						proxy_http_version 1.1;
						proxy_set_header Upgrade    $http_upgrade;
						proxy_set_header Connection $http_connection;
					'';
				};
			};
		};
	};

}
