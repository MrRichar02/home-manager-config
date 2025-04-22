{lib, config, ...}:
{
  options.myModules.kitty.enable = lib.mkEnableOption "enables kitty module";

  config = lib.mkIf config.myModules.kitty.enable {
    programs.kitty = {
      enable = true;
    };
  };
}
