{lib, config, ...}:
{
  options.myModules.obs.enable = lib.mkEnableOption "enables obs module";

  config = lib.mkIf config.myModules.obs.enable {
    programs.obs-studio = {
      enable = true;
    };
  };
}
