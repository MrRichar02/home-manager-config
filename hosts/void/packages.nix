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
    xwayland
    xwayland-run

    swaynotificationcenter

    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only

    #browsers
    inputs.zen-browser.packages."${system}".default # beta not sigma :(

    # nixgl
    inputs.nixGL.packages.${system}.nixGLIntel

    #editors
    # inputs.nvf-flake.packages.${system}.default
    nvim-pkg

		vscodium

    #password manager
    bitwarden-desktop

    #wallpaper
    waypaper
    swww

    # db
    dbeaver-bin

    #chat apps
    vesktop
    zapzap

    #music player
    youtube-music

    onlyoffice-bin

    mars-mips
  ];
}
