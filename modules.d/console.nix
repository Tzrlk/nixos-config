{ config, pkgs, lib, ... }: {

  environment.systemPackages = with pkgs; [

    # Tools
    ranger # file browser
    ncdu   # filesystem usage
    nload  # network monitoring

  ];

}
