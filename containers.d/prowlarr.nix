{ config, pkgs, ... }: {

	containers.prowlarr = {
		autoStart = true;
		privateNetwork = true;
		bindMounts = {
			"/media" = {
				hostPath = "/media";
				isReadOnly = false;
			};
		};
		forwardPorts = [
			{ containerPort = 9696; hostPort = 9696; }
		];
		config = { config, pkgs, ... }: {
			system.stateVersion = "22.11";
			nixpkgs.config.allowUnfree = true;
			environment.systemPackages = [ pkgs.prowlarr ];
			services.prowlarr = {
				enable = true;
			};
		};
	};

	# Let this container access the internet.
	networking.nat.internalInterfaces = [ "ve-prowlarr" ];

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/prowlarr" = {
					proxyPass = "http://127.0.0.1:9696";
#					proxyRedirect = "off";
#					proxyHttpVersion = "1.1";
#					proxySetHeader Upgrade $http_upgrade;
#					proxy_set_header Connection $http_connection;
				};
#				"/prowlarr(/[0-9]+)?/api" = {
#				};
			};
		};
	};

}
