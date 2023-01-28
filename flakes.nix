{ config, pkgs, lib, ... }: let

	nix-software-center = (import (pkgs.fetchFromGitHub {
        owner  = "vlinkz";
        repo   = "nix-software-center";
        rev    = "0.1.0";
        sha256 = "d4LAIaiCU91LAXfgPCWOUr2JBkHj6n0JQ25EqRIBtBM=";
    })) {};

    nixos-conf-editor = (import (pkgs.fetchFromGitHub {
        owner  = "vlinkz";
        repo   = "nixos-conf-editor";
        rev    = "0.0.6";
        sha256 = "sha256-wJMUY4OCntFfR1BkTsia5tdNmaF5MBB3/n208Q/MPGA=";
    })) {};

in {

	# flakes
	environment.systemPackages = with pkgs; [
		nix-software-center
		nixos-conf-editor
	];

}
