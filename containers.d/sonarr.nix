{ config, pkgs, ... }: {

	containers.sonarr = {
		autoStart = true;
		privateNetwork = true;
		bindMounts = {
			"/media" = {
				hostPath = "/media";
				isReadOnly = false;
			};
			"/var/lib/sonarr" = {
				hostPath = "/var/lib/sonarr";
				isReadOnly = false;
			};
		};
		config = { config, pkgs, ... }: {
			system.stateVersion = "22.11";
			nixpkgs.config.allowUnfree = true;
			environment.systemPackages = [ pkgs.sonarr ];
			services.sonarr = {
				enable = true;
			};
		};
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/sonarr" = {
				};
			};
		};
	};

}
