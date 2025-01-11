{ ... }: {
	imports = [
		./boot.nix
		./console.nix
#		./containers.nix
		./develop.nix
#		./fileshare.nix
		./hardware.nix
		./network.nix
#		./nginx.nix
		./system.nix
		./users.nix
		./xserver.nix
	];
}
