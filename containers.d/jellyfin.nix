{ config, pkgs, ... }: {

	containers.jellyfin = {
		autoStart = true;
		privateNetwork = true;
		bindMounts = {
			"/media" = {
				hostPath = "/media";
				isReadOnly = false;
			};
		};
		config = { config, pkgs, ... }: {
			system.stateVersion = "22.11";
			nixpkgs.config.allowUnfree = true;
			environment.systemPackages = [ pkgs.jellyfin ];
			services.jellyfin = {
				enable = true;
			};
		};
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/jellyfin" = {
				};
			};
		};
	};

}
