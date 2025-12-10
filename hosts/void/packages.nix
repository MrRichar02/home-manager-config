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

    swaynotificationcenter

    nerd-fonts.jetbrains-mono
    nerd-fonts.symbols-only

    #browsers
    librewolf

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

    onlyoffice-desktopeditors

    mars-mips

    fastfetch

    logisim-evolution
  ];
}
