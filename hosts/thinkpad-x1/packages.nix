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
    librewolf-bin

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

    vscodium-fhs

    onlyoffice-desktopeditors

    nerd-fonts.zed-mono

    tmux
    zed-editor-fhs
    xfce.thunar
    noto-fonts
    noto-fonts-cjk-sans

		nixd
		alejandra

		koodo-reader
  ];
}
