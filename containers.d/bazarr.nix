{ config, pkgs, ... }: {

	containers.bazarr = {
		autoStart = true;
		privateNetwork = true;
		bindMounts = {
			"/media" = {
				hostPath = "/media";
				isReadOnly = false;
			};
		};
		forwardPorts = [
            { containerPort = 6767; hostPort = 6767; }
        ];
		config = { config, pkgs, ... }: {
			system.stateVersion = "22.11";
			nixpkgs.config.allowUnfree = true;
			environment.systemPackages = [ pkgs.bazarr ];
			services.bazarr = {
				enable = true;
			};
		};
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/bazarr" = {
				};
			};
		};
	};

}
