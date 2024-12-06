{ config, pkgs, lib, ... }: {

	imports = [ ./containers.d/index.nix ];

	environment.systemPackages = with pkgs; [
		podman
		podman-compose
		podman-tui
		pods
	];

	virtualisation = {
		podman = {
			enable       = true;
			enableNvidia = true;
			dockerCompat = true;

			dockerSocket.enable = true;
#			networkSocket = {
#				enable        = true;
#				listenAddress = "127.0.0.1";
#				port          = 2376; # default
#				server        = "ghostunnel";
#				tls           = {
#					cacert = ""; # TODO: UGH
#					cert   = "";
#					key    = "";
#				};
#			};

			defaultNetwork.dnsname.enable = true;
		};
		oci-containers = {
			backend    = "podman";
			containers = {
			};
		};
	};

}
