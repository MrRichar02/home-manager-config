{lib, config, ...}:
{
  options.myModules.oh-my-posh.enable = lib.mkEnableOption "enables oh-my-posh module";

  config = lib.mkIf config.myModules.oh-my-posh.enable {
    programs.oh-my-posh = {
      enable = true;
      useTheme = "catppuccin_mocha";
      # useTheme = "robbyrussell";
    };
  };
}
