{ config, pkgs, ... }: {

	containers.komga = {
		autoStart = true;
		privateNetwork = true;
		bindMounts = {
			"/media" = {
				hostPath = "/media";
				isReadOnly = false;
			};
		};
		forwardPorts = [
            { containerPort = 8080; hostPort = 8086; } # TODO: change this.
        ];
		config = { config, pkgs, ... }: {
			system.stateVersion = "22.11";
			nixpkgs.config.allowUnfree = true;
			environment.systemPackages = [ pkgs.komga ];
			services.komga = {
				enable = true;
			};
			# TODO: create application.yml at /config
		};
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/komga" = {
				};
			};
		};
	};

}
