{ pkgs, inputs, ...}:
{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
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
    youtube-music

    #note taking
    obsidian

    #sql things
    dbeaver-bin

    #lab-2 arqui
    postman
  ];
}
