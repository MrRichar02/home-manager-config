{
  lib,
  config,
  pkgs,
  ...
}: {
  options.myModules.kitty.enable = lib.mkEnableOption "enables kitty module";

  config = lib.mkIf config.myModules.kitty.enable {
    programs.kitty = {
      enable = true;
      font = {
        name = "Monocraft Nerd Font";
        package = pkgs.monocraft;
        size = 15;
      };
      themeFile = "Catppuccin-Mocha";
    };
  };
}
