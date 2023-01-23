{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.home-assistant ];
	services.home-assistant = {
		enable       = true;
		openFirewall = true;
		config.text  = ''
		{
			homeassistant = {
				name = "Der Lebensraum";
			};
		}
		'';
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/cabal" = {
				};
			};
		};
	};

}
