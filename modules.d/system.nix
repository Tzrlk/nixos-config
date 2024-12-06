{ config, pkgs, lib, ... }: {

	environment = {

		systemPackages = with pkgs; [
            nixos-option
        ];

        shellAliases = {
            nix-opt  = "nixos-option";
            nix-run  = "nixos-rebuild switch";
            nix-test = "nixos-rebuild test";
        };

	};

	services.cron = {
		enable = true;
		systemCronJobs = [
			"@daily root nix-collect-garbage --delete-older-than 30d >/var/log/nix-gc.log 2>&1"
		];
	};

}
