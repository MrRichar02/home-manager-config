{ pkgs, inputs, ...}:
{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    #editors
    inputs.nixvim-flake.packages.${system}.default

    #office apps
    onlyoffice-desktopeditors

    #wallpaper
    waypaper

    #chat apps
    vesktop
    zapzap

    #browsers
    inputs.zen-browser.packages."${system}".default # beta not sigma :(
    google-chrome

    #system utilities
    hyprshot
    hyprlock
    brightnessctl
    wl-clipboard

    #file manager
    kdePackages.dolphin

    #music player
    spotify

    #ideas
    jetbrains.idea-ultimate
    helix

    #helix lsp
    nixd

    #request thing
    postman

    #comunicaciones
    wireshark

    #note taking
    obsidian

    #hyprland screen sharing dependencies
    # wireplumber
    # grim
    # slurp
    # kdePackages.xwaylandvideobridge

  ];
}
