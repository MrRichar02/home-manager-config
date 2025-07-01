{inputs, pkgs, system, ...}:
{
  home.packages = with pkgs;[
    #browsers
    inputs.zen-browser.packages."${system}".default # beta not sigma :(

    #system utilities
    hyprshot
    hyprlock
    brightnessctl
    wl-clipboard

    #file manager
    kdePackages.dolphin

    #music
    youtube-music
  ];
}
