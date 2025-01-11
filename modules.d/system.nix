{ config, pkgs, lib, ... }: {

	environment = {

		systemPackages = with pkgs; [
            nixos-option
        ];

        shellAliases = {
        };

	};

	services.cron = {
		enable = true;
		systemCronJobs = [
#			"@daily root nix-collect-garbage --delete-older-than 30d >/var/log/nix-gc.log 2>&1"
		];
	};

	nix = {
		optimise.automatic = true;
		settings.auto-optimise-store = true;
		gc.automatic = true;
	};

}
