{ pkgs, ... }: { containers = {

	sonarr = {
		privateNetwork = true;
		config = { config, pkgs, ... }: {
			nixpkgs = [ sonarr ];
		};
	};

	radarr = {
		privateNetwork = true;
		config = { config, pkgs, ... }: {
			nixpkgs = [ radarr ];
		};
	};

	lidarr = {
		privateNetwork = true;
		config = { config, pkgs, ... }: {
			nixpkgs = [ lidarr ];
		};
	};

	# TODO: readarr
	# TODO: prowlarr

	komga = {
		privateNetwork = true;
		config = { config, pkgs, ... }: {
			nixpkgs = [ komga ];
		};
	};

	aria = {
		privateNetwork = true;
		config = { config, pkgs, ... }: {
			nixpkgs = [ aria ];
		};
	};

	jellyfin = {
		privateNetwork = true;
		config = { config, pkgs, ... }: {
			nixpkgs = [ jellyfin ];
		};
	};

	nginx = {
		privateNetwork = false;
		config = { config, pkgs, ... }: {
			nixpkgs = [ nginx ];
		};
	};

}; };
