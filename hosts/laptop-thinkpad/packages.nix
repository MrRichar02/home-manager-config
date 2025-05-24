{ pkgs, inputs, ...}:
{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    ciscoPacketTracer8

    #editors
    inputs.nixvim-flake.packages.${system}.default

    #wallpaper
    waypaper

    #chat apps
    vesktop
    zapzap

    #browsers
    inputs.zen-browser.packages."${system}".default # beta not sigma :(
    #google-chrome

    #system utilities
    hyprshot
    hyprlock
    brightnessctl
    wl-clipboard

    #file manager
    kdePackages.dolphin

    #music player
    #spotify
    youtube-music

    #ideas
    jetbrains.idea-ultimate

    #note taking
    obsidian

    #sql things
    dbeaver-bin

    # #video conferencing
    # zoom-us
    # xdg-desktop-portal-hyprland

    #hyprland screen sharing dependencies
    # wireplumber
    # grim
    # slurp
    kdePackages.xwaylandvideobridge

    #lab-2 arqui
    postman
  ];
}
