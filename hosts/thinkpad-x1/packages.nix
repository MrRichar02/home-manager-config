{
  pkgs,
  inputs,
  ...
}: let
  screenshotmango = pkgs.writeShellScriptBin "screenshotmango" ''
    ${pkgs.grim}/bin/grim -l 0 -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy
  '';
in {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    utilities-menu
    waybar
    screenshotmango
    brightnessctl
    # inputs.mango.packages.${system}.mango

    heroic

    #editors
    # inputs.nvf-flake.packages.${system}.default
    nvim-pkg

    #password manager
    bitwarden-desktop

    #wallpaper
    waypaper
    #chat apps
    vesktop
    zapzap

    prismlauncher

    tldr

    onlyoffice-desktopeditors

    nerd-fonts.zed-mono

    tmux

    kdePackages.dolphin

    noto-fonts
    noto-fonts-cjk-sans

    nixd
    alejandra

    koodo-reader
    zoom-us

    hyprshot
    hyprsunset
    hyprpicker
    wiremix
    helvum

    quickshell

    pastel

    wl-clipboard
    brave
  ];
}
