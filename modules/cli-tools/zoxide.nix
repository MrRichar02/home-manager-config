{lib, config, ...}:
{
  options.myModules.zoxide.enable = lib.mkEnableOption "enables zoxide";

  config = lib.mkIf config.myModules.zoxide.enable {
    programs.zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}

