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

    teams-for-linux

    vscodium-fhs

    onlyoffice-desktopeditors

    mars-mips

		logisim-evolution

		nerd-fonts.zed-mono

		tmux
  ];
}
