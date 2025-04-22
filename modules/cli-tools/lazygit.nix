{lib, config, ...}:
{
  options.myModules.lazygit.enable = lib.mkEnableOption "enables lazygit module";

  config = lib.mkIf config.myModules.lazygit.enable {

    programs.lazygit = {
      enable = true;
    };
  };
}
