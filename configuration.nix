{ config, pkgs, lib, ... }: {
	system.stateVersion = "22.11";
	system.copySystemConfiguration = true;

	imports = [ ./modules.d/index.nix ];

	nix.settings.experimental-features = [ "nix-command" "flakes" ];

	nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
	nixpkgs.config.allowUnfree = true;

	time.timeZone = "Pacific/Auckland";
	i18n.defaultLocale = "en_NZ.UTF-8";

}

