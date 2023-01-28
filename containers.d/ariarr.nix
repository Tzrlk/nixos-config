{ config, lib, pkgs, ... }: let

	# https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/javascript.section.md
	webui-aria2 = pkgs.buildNpmPackage rec {
		pname   = "webui-aria2";
		version = "1.0.0";
		src = pkgs.fetchFromGitHub {
			owner = "ziahamza";
			repo  = "webui-aria2";
			rev   = "109903f0e2774cf948698cd95a01f77f33d7dd2c";
			hash  = "sha256-Nxo27o0xW/US+KY/ZrNkLe7/1Lns9vjtyQwam2nmXzg=";
		};
		npmDepsHash = "sha256-8tL4R9TOH+aK5cfg9hYiHr1uqrbWMhxBQM/MHTDfBxY=";
		meta = with lib; {
			description = "The worlds best and hottest interface to interact with aria2.";
			homepage    = "https://github.com/ziahamza/webui-aria2#readme";
			maintainers = with maintainers; [ ziahamza nmaier ];
		};
	};

in {

	environment.systemPackages = with pkgs; [
#		webui-aria2
		aria
	];

	services.aria2 = {
		enable         = true;
		downloadDir    = "/media/downloads";
		rpcListenPort  = 6800; # default
		rpcSecret      = "aria2rpc"; # default
		openPorts      = true;
		extraArguments = lib.strings.concatStringsSep " " [
				"--optimize-concurrent-downloads=true"
				"--max-connection-per-server=2"
				"--bt-enable-lpd=true"
				"--gid=100"
				"--seed-ratio=1.5"
				"--seed-time=1440"
		];
	};

	users.users."aria2".extraGroups = [ "users" ];

	systemd.services.jellyfin.serviceConfig.Restart = lib.mkForce "always";

	# nodejs project: https://github.com/ziahamza/webui-aria2
	# try to install npm package from github directly.

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/ariarr/rpc" = {
					proxyPass = "http://localhost:6800/rpc";
				};
				"/ariarr" = {

				};
			};
		};
	};

}
