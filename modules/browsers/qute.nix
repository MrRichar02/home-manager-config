{lib, config, ...}:
{
  options.myModules.quteBrowser.enable = lib.mkEnableOption "enables qutebrowser module";

  config = lib.mkIf config.myModules.quteBrowser.enable {
    programs.qutebrowser = {
      enable = true;
      
      settings = {
        colors.webpage.darkmode = {
          enabled = true;
          algorithm = "lightness-cielab";
        };
      };
      searchEngines = {
        yt = "https://www.youtube.com/results?search_query={}";
        np = "https://search.nixos.org/packages?channel=unstable&type=packages&query={}";
      };
    };
  };
}

