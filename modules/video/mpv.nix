{lib, config, ...}:
{
  options.myModules.mpv.enable = lib.mkEnableOption "enables mpv module";

  config = lib.mkIf config.myModules.mpv.enable {
    programs.mpv = {
      enable = true;
    };
  };
}
