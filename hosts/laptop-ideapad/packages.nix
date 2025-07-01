{ pkgs, inputs, ...}:
{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #editors
    inputs.nvf-flake.packages.${system}.default

    #wallpaper
    waypaper

    #chat apps
    vesktop
    zapzap

    #note taking
    obsidian

    #sql things
    dbeaver-bin

    #lab-2 arqui
    postman
  ];
}
