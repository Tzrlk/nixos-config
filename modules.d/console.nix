{ config, pkgs, lib, ... }: {

	environment = {

		systemPackages = with pkgs; [

            # Utils
            wget
            nixos-option
            usbutils

            # Tools
            ranger # file browser
            ncdu   # filesystem usage
            nload  # network monitoring

        ];

        shellAliases = {
            nixopt = "nixos-option";
        };

	};

	console = {
		font   = "Lat2-Terminus16";
		keyMap = "us";
	};



}
