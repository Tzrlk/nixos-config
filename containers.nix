{ config, pkgs, lib, ... }: {

  imports = [
    ./containers.d/ariarr.nix
    ./containers.d/bazarr.nix
    ./containers.d/hasst.nix
    ./containers.d/jellyfin.nix
    ./containers.d/komga.nix
    ./containers.d/lidarr.nix
    ./containers.d/prowlarr.nix
    ./containers.d/radarr.nix
    ./containers.d/sonarr.nix
    ./containers.d/jackett.nix
    ./containers.d/organizr.nix
  ];

  # Common config?

}
