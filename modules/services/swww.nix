{lib, config, ...}:
{
  options.myServices.swww.enable = lib.mkEnableOption "enables swww service";

  config = lib.mkIf config.myServices.swww.enable {
    services.swww = {
      enable = true;
    };
  };
}
