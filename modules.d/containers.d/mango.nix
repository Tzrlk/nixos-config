{ config, lib, pkgs, ... }: let
	port     = "9000";
	dir_conf  = "/home/media/.config/mango";
	dir_media = "/data/media/manga";
	dir_data  = "/opt/mango";
	dir_plugins = "/home/tzrlk/dev/mango-plugins/plugins";

in {

	systemd.tmpfiles.rules = [
		"d ${dir_conf}  754 media media"
		"d ${dir_media} 754 media media"
		"d ${dir_data}  754 media media"

		"d ${dir_data}/uploads 754 media media"
		"d ${dir_data}/plugins 754 media media"
	];

	virtualisation.oci-containers.containers.mango = {
		image   = "hkalexling/mango:v0.27.0";
		ports   = [ "${port}:${port}" ];
		volumes = [
			"${dir_conf}:/root/.config/mango:rw"
			"${dir_media}:/root/mango/library:rw"
			"${dir_data}/library.yml.gz:/root/mango/library.yml.gz:rw"
			"${dir_data}/mango.db:/root/mango.db:rw"
			"${dir_data}/queue.db:/root/mango/queue.db:rw"
			"${dir_data}/uploads:/root/mango/uploads:rw"

			"${dir_plugins}/mangadex:/root/mango/plugins/mangadex:rw"
			"${dir_plugins}/manganato:/root/mango/plugins/manganato:rw"
			"${dir_plugins}/webtoons:/root/mango/plugins/webtoons:rw"

		];
	};

	services.nginx.virtualHosts = {
		"prometheus.aetheric.co.nz" = {
			locations = {
				"/mango/" = {
					proxyPass = "http://localhost:${port}/";
				};
			};
		};
	};

}
