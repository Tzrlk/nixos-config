{ config, pkgs, lib, ... }: {

	environment = {

		systemPackages = with pkgs; [

            # Utils
#            wget
#            usbutils

            # Tools
#            ranger # file browser
#            ncdu   # filesystem usage
#            nload  # network monitoring

        ];

        shellAliases = {
        };

	};

	console = {
		font   = "Lat2-Terminus16";
		keyMap = "us";
	};



}
