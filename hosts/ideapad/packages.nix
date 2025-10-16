{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
		inputs.mango.packages.${system}.mango
    #browsers
    inputs.zen-browser.packages."${system}".default # beta not sigma :(
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
    # obsidian

    #sql things
    dbeaver-bin

    #request
    postman

    #music
    youtube-music

    #meetings
    zoom-us

    teams-for-linux

    vscode-fhs

    mars-mips

		prismlauncher
  ];
}
