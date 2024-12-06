{ config, pkgs, lib, ... }: {

	environment = {

		systemPackages = with pkgs; [

			nil

			git
			gnumake

			# Set up vim with desired default plugins and config.
			(vim_configurable.customize {
				name = "vim";
				vimrcConfig = {

					packages.plugins = with vimPlugins; {
						start = [

							# File Types
							nginx-vim
							vim-nix
							vim-json

							# Tools

						];
						opt = [

							# Tools
							ranger-vim

						];
					};

					customRC = ''
						syntax on
						set colorcolumn=80
						set tabstop=4
						set shiftwidth=4
						set softtabstop=4
						set backspace=indent,eol,start
						set number
					'';

				};
			})

		];

		variables = {
			EDITOR = "vim";
		};



	};

}
