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
		screenshotmango
    kdePackages.xwaylandvideobridge
    brightnessctl
    inputs.mango.packages.${system}.mango

    heroic
    zoom-us
    #browsers
    inputs.zen-browser.packages."${system}".default # beta not sigma :(

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

    #music player
    youtube-music

    #lab-2 arqui
    postman

    teams-for-linux

    vscode-fhs

    onlyoffice-bin

    mars-mips
  ];
}
