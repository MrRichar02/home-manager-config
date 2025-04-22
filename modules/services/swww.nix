{lib, config, ...}:
{
  options.myModules.swww.enable = lib.mkEnableOption "enables swww module";

  config = lib.mkIf config.myModules.swww.enable {
    services.swww = {
      enable = true;
    };
  };
}
