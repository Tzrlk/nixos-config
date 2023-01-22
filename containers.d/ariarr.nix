{ config, pkgs, ... }: {

	containers.komga = {
		autoStart = true;
		privateNetwork = true;
		bindMounts = {
			"/media" = {
				hostPath = "/media";
				isReadOnly = false;
			};
			"/usr/local/prowlarr" = {
				hostPath = "/usr/local/prowlarr";
				isReadOnly = false;
			};
		};
		config = { config, pkgs, ... }: {
			system.stateVersion = "22.11";
			nixpkgs.config.allowUnfree = true;
			environment.systemPackages = [ pkgs.aria ]; # uGet?
			services.aria2 = {
				enable = true;
				downloadDir = "/media/downloads";
			};
			# nodejs project: https://github.com/ziahamza/webui-aria2
		};
	};

	# Let this container access the internet.
	networking.nat.internalInterfaces = [ "ve-ariarr" ];

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/komga" = {
				};
			};
		};
	};

}
