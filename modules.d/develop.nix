{ config, pkgs, lib, ... }: {

	environment.systemPackages = with pkgs; [

		nil

		git

		vim
		vimPlugins.nginx-vim
		vimPlugins.ranger-vim
		vimPlugins.vim-nix
		vimPlugins.vim-pathogen

	];

}
