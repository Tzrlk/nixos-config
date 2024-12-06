{ config, pkgs, lib, ... }: {
	users.mutableUsers = false;

	# Root settings.
	users.users.root = {
		hashedPassword = "$6$l/J3ViVWEbajlMzH$4h70CEggZDONSIPL6gvR2f.9UlgUXYSqDk5Ou0JH5ZpSp87a2Q68kWwB5vw35tS8zaCy5OLOwTSKk4qwL6FWz/";
	};

	# Media user.
	users.groups.media = {};
	users.users.media  = {
		isSystemUser = true;
		group        = "media";
		description  = "Owner/operator of all media server functions and data.";
	};

	# Main user.
	users.users.tzrlk = {
		isNormalUser = true;
		extraGroups = [
		  "wheel"
		  "networkmanager"
		  "media"
		  "podman"
		  "users"
		  "aria2"
		];
		hashedPassword = "$6$aH7aw9BTd2D3H6mC$JkzHgh64edJBJZWDPKgiEl9Rj42dB676XUMyfZHX6WuSxfJ1H62x7vZBfcJbV7HiVTXzxVARQ9C5QhgTJop16.";
		packages = with pkgs; [
			jetbrains.idea-ultimate
		];
	};

}

