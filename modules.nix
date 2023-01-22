{ config, pkgs, lib, ... }: {

	# There has to be a better way to do this.
	imports = [
		./modules.d/boot.nix
		./modules.d/network.nix
		./modules.d/nginx.nix
		./modules.d/xserver.nix
	];

}