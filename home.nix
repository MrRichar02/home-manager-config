{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "docair";
  home.homeDirectory = "/home/docair";

  imports = [
    #wms
    ./wms/hyprland.nix

    #cli-tools
    ./cli-tools/tmux.nix
    ./cli-tools/lazygit.nix
    ./cli-tools/oh-my-posh.nix
    ./cli-tools/git.nix
    ./cli-tools/ranger.nix
    ./cli-tools/nnn.nix

    #shells
    ./shells/nushell/nushell.nix
    ./shells/bash/bash.nix

    #terminals
    ./terminals/kitty.nix

    #vscode
    ./editors/vscode/vscode.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [

    #editors
    inputs.nvf-flake.packages.x86_64-linux.default

    #office apps
    onlyoffice-desktopeditors

    #notifications
    swaynotificationcenter
    libnotify

    #wallpaper
    swww
    waypaper

    #fetch
    fastfetch

    #terminals
    kitty 

    #terminal font
    monocraft

    #chat apps
    vesktop
    zapzap

    #app launcher
    rofi

    #browsers
    brave
    inputs.zen-browser.packages."${system}".default # beta not sigma :(

    #bars
    waybar

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
    jetbrains.idea-community

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

  home.file.".config/waybar" = {
    source = ./bars/waybar;
    recursive = true;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.vanilla-dmz;
      name = "Vanilla-DMZ";
      size = 24;
    };
  };

  home.pointerCursor = {
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ";
    size = 24;
    gtk.enable = true;
    #hyprcursor = {
    #  enable = true;
    #  size = 24;
    #};
  };

  programs.taskwarrior = {
    enable = true;
    package = pkgs.taskwarrior3;
  };

  #Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
