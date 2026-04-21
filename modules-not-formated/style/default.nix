{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.myModules.stylix;
in {
  options.myModules.stylix = {
    enable = lib.mkEnableOption "Enable or disable custom stylix module";
  };

  config = lib.mkIf cfg.enable {
    stylix = {
      enable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
      targets = {
        rofi.enable = false;
        qutebrowser.enable = false;
        kitty.enable = false;
        waybar.enable = false;
        # starship.enable = false;
        zen-browser.profileNames = ["default"];
      };

      cursor = {
        package = pkgs.rose-pine-cursor;
        name = "BreezeX-RosePine-Linux";
        size = 24;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
        };

        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };

        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

        sizes = {
          applications = 12;
          terminal = 15;
          desktop = 12;
          popups = 12;
        };
      };

      opacity = {
        applications = 1.0;
        terminal = 1.0;
        desktop = 1.0;
        popups = 1.0;
      };

      polarity = "dark";
    };
  };
}
