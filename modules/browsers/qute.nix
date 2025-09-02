{
  lib,
  config,
  pkgs,
  ...
}: {
  options.myModules.quteBrowser.enable = lib.mkEnableOption "enables qutebrowser module";

  config = lib.mkIf config.myModules.quteBrowser.enable {
    programs.qutebrowser = {
      enable = true;

      extraConfig = ''
config.set('colors.webpage.darkmode.enabled', False, 'file://*')
#privacy
config.set("content.webgl", False, "*")
#config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
#config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
#config.set("content.cookies.accept", "all")
#config.set("content.cookies.store", True)
		'';

      settings = {
        colors.webpage.darkmode = {
          enabled = true;
          algorithm = "lightness-cielab";
          policy.images = "never";
        };
        auto_save.session = true;
        spellcheck.languages = ["en-US" "es-ES"];
				qt.args = ["disable-features=PermissionElement"];
      };
      searchEngines = {
        yt = "https://www.youtube.com/results?search_query={}";
        np = "https://search.nixos.org/packages?channel=unstable&type=packages&query={}";
        hm = "https://home-manager-options.extranix.com/?query={}&release=master";
      };

      quickmarks = {
        bitwarden = "https://vault.bitwarden.com/#/vault";

        gmail = "https://mail.google.com/mail/u/0/#inbox";

        udearroba = "https://udearroba.udea.edu.co/internos/my/";
        ingenia = "https://virtualingenieriaudea.co/my/";
        udea = "https://www.udea.edu.co/wps/portal/udea/web/inicio/somos-udea/estudiantes";

        arqui = "https://udearroba.zoom.us/j/92917572997";
        calidad = "https://udearroba.zoom.us/j/97886573439";
        fundamentos = "https://udearroba.zoom.us/j/99736892062";
        comu-2 = "https://udearroba.zoom.us/j/94871308458";
        lab-fis = "https://udearroba.zoom.us/j/99311730710";
      };

      keyBindings = {
        normal = {
          "<Ctrl-ñ>" = "hint links spawn --detach mpv {hint-url}";
        };
      };
    };
  };
}
