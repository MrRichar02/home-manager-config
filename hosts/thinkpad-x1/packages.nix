{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    zoom-us

    prismlauncher

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
  ];
}
