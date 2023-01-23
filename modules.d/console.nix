{ config, pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [

    # Tools
    ranger # file browser
    ncdu   # filesystem usage
    nload  # network monitoring

    # Dev
    git
    vim
    vimPlugins.nginx-vim
    vimPlugins.ranger-vim
    vimPlugins.vim-nix
    vimPlugins.vim-pathogen

  ];

}
