{ pkgs, inputs, ...}:
{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    prismlauncher

    #editors
    inputs.nvf-flake.packages.${system}.default

    #password manager
    bitwarden-desktop

    #wallpaper
    waypaper

    #chat apps
    vesktop
    zapzap

    #music player
    youtube-music

    #note taking
    obsidian

    #lab-2 arqui
    postman
  ];
}
