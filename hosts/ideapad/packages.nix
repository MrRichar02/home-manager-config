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
    #browsers
    librewolf-bin
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

    #sql things
    dbeaver-bin

    #request
    postman

    #meetings
    zoom-us

    mars-mips

    prismlauncher

    xfce.thunar

    noto-fonts
    noto-fonts-cjk-sans

    vscodium-fhs
    zed-editor-fhs
  ];
}
