{ pkgs, inputs, ...}:
{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #ciscoPacketTracer8

    minikube
    kubectl

    #editors
    inputs.nvf-flake.packages.${system}.default

    #password manager
    bitwarden-desktop

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

    # video
    ffmpeg_6-full


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


    #hyprland screen sharing dependencies
    # wireplumber
    # grim
    # slurp
    kdePackages.xwaylandvideobridge

    #lab-2 arqui
    postman
  ];
}
