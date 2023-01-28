{ config, pkgs, lib, ... }: {

	# There has to be a better way to do this.
	imports = [
		./modules.d/boot.nix
		./modules.d/console.nix
		./modules.d/develop.nix
		./modules.d/fileshare.nix
		./modules.d/network.nix
		./modules.d/nginx.nix
		./modules.d/xserver.nix
	];

}
