{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
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
