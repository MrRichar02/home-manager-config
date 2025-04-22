{lib, config, ...}:
{
  options.myModules.fastfetch.enable = lib.mkEnableOption "enables fastfetch";

  config = lib.mkIf config.fastfetchModule.enable {
    programs.fastfetch = {
      enable = true;
    };
  };
}
