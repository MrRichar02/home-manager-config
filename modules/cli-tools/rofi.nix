{lib, config, ...}:
{
  options.myModules.rofi.enable = lib.mkEnableOption "enables rofi module";

  config = lib.mkIf config.myModules.rofi.enable {

    programs.rofi = {
      enable = true;
    };
  };
}
