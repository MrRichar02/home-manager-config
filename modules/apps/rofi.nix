{
  lib,
  config,
  pkgs,
  ...
}: {
  options.myModules.rofi.enable = lib.mkEnableOption "enables rofi module";

  config = lib.mkIf config.myModules.rofi.enable {

    home.packages = [
      pkgs.monocraft
    ];

		fonts.fontconfig.enable = true;

    programs.rofi = {
      enable = true;

      package = pkgs.rofi-wayland;

      font = "Monocraft Nerd Font 12";

      plugins = [
        pkgs.rofi-emoji-wayland
      ];

      theme = let
        # Use `mkLiteral` for string-like values that should show without
        # quotes, e.g.:
        # {
        #   foo = "abc"; => foo: "abc";
        #   bar = mkLiteral "abc"; => bar: abc;
        # };
        inherit (config.lib.formats.rasi) mkLiteral;
      in {
        configuration = {
          "drun-display-format" = "{icon} {name} [<span weight='light' size='small'><i>({generic})</i></span>]";
          "display-drun" = "Apps";
          "show-icons" = true;
          "hide-scrollbar" = true;
          "fixed-num-lines" = true;
          "lines" = 12;
        };

        "*" = {
          "background-color" = mkLiteral "#00000000";
          "border-color" = mkLiteral "#2e343f";
          "text-color" = mkLiteral "#8c90aa";
          "spacing" = 0;
        };

        window = {
          "background-color" = mkLiteral "#282C33F0";
          "width" = mkLiteral "50%";
        };

        overlay = {
          "background-color" = mkLiteral "magenta";
        };

        inputbar = {
          "padding" = mkLiteral "8px";
          "border" = mkLiteral "0 0 1px 0";
          "children" = mkLiteral "[prompt,entry]";
        };

        prompt = {
          "padding" = mkLiteral "0px 8px";
          "border" = mkLiteral "0 1px 0 0";
        };

        textbox = {
          "border" = mkLiteral "0 0 1px 0";
          "border-color" = mkLiteral "#282C33";
          "padding" = mkLiteral "8px 16px";
        };

        entry = {
          "padding" = mkLiteral "0px 8px";
        };

        element = {
          "border" = mkLiteral "0 0 1px 0";
          "padding" = mkLiteral "8px 16px";
        };

        "element-icon" = {
          "size" = mkLiteral "1em";
        };

        "element selected" = {
          "background-color" = mkLiteral "#FFFFFF10";
          "text-color" = mkLiteral "#9da0bb";
        };
      };
    };
  };
}
