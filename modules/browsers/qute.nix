{lib, config, ...}:
{
  options.myModules.quteBrowser.enable = lib.mkEnableOption "enables qutebrowser module";

  config = lib.mkIf config.myModules.quteBrowser.enable {
    programs.qutebrowser = {
      enable = true;
      
      settings = {
        c.colors.webpage.darkmode = {
          enable = true;
          algorithm = "lightness-cielab";
        };
      };
    };
  };
}

