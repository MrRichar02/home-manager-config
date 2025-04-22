{ pkgs, inputs, ...}:
{

  home.packages = with pkgs; [

    #editors
    inputs.nixvim-flake.packages.${system}.default

    #office apps
    onlyoffice-desktopeditors

    #wallpaper
    waypaper

    #terminal font
    monocraft

    #chat apps
    vesktop
    zapzap

    #browsers
    #brave
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

    #note taking
    obsidian

    #hyprland screen sharing dependencies
    wireplumber
    xdg-desktop-portal-hyprland
    grim
    slurp
    kdePackages.xwaylandvideobridge

    #Kde icons
    kdePackages.breeze
    kdePackages.breeze-icons
    libsForQt5.kio-extras
    kdePackages.qtsvg

  ];
}
