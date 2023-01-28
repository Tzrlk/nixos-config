{ config, lib, pkgs, ... }: {

	environment.systemPackages = [ pkgs.home-assistant ];

	services.home-assistant = {
		enable       = true;
		openFirewall = true;
		config = {
			homeassistant = {
				name = "Der Lebensraum";
				unit_system = "metric";
				temperature_unit = "C";
				currency = "NZD";
			};
			http = {
				server_host         = [ "127.0.0.1" ];
				trusted_proxies     = [ "127.0.0.1" ];
				use_x_forwarded_for = true;
			};
		};
	};

	systemd.services.home-assistant.serviceConfig.Restart = lib.mkForce "always";

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				# https://community.home-assistant.io/t/reverse-proxy-using-nginx/196954
				"/hass" = {
					proxyPass = "http://localhost:8123";
				};
			};
		};
	};

}
