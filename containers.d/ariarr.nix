{ config, pkgs, ... }: {

	environment.systemPackages = [ pkgs.aria ]; # uGet?

	services.aria2 = {
		enable = true;
		downloadDir = "/media/downloads";
	};
	# nodejs project: https://github.com/ziahamza/webui-aria2

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/ariarr" = {
				};
			};
		};
	};

}
