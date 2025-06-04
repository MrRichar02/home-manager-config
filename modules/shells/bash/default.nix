{lib, config, ...}:
{
  options.myModules.bash.enable = lib.mkEnableOption "enables bash module";

  config = lib.mkIf config.myModules.bash.enable {
    programs.bash = {
      enable = true;
    };
  };
}
