{ config, pkgs, ... }: {

	networking.firewall = {
		enable          = true;
		allowedTCPPorts = [ 80 443 ];
	};

	# LetsEncrypt config.
	security.acme = {
		defaults.email = "peterc@aetheric.co.nz";
		acceptTerms = true;
	};

	# Common nginx setup.
	services.nginx = {
		enable       = true;
		enableReload = true;

		recommendedTlsSettings   = true;
		recommendedOptimisation  = true;
		recommendedGzipSettings  = true;
		recommendedProxySettings = true;

		virtualHosts = {
			"prometheus.aetheric.co.nz" = {
				http2      = true;
				enableACME = true;
				forceSSL   = true;
				serverAliases = [
#					"media.aetheric.co.nz"
				];
			};
		};

	};

}