{
  pkgs,
  pkgsu,
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
    screenshotmango
    layouts-mango-menu
    brightnessctl
    inputs.mango.packages.${system}.mango
    #browsers
    # inputs.zen-browser.packages."${system}".default # beta not sigma :(
    #editors
    # inputs.nvf-flake.packages.${system}.default
    nvim-pkg

    #wallpaper
    waypaper

    #password manager
    bitwarden-desktop

    #chat apps
    vesktop
    zapzap

    #note taking
    obsidian

    prismlauncher

    kdePackages.dolphin

    noto-fonts
    noto-fonts-cjk-sans

    nixd
    alejandra

    tldr

    wiremix
    helvum
    waybar
    pastel

    wlsunset
    hyprpicker
    wl-clipboard
    cliphist
    wl-clip-persist
    clipse
    brave
    heroic
    localsend

    pkgsu.vscodium-fhs
  ];
}
