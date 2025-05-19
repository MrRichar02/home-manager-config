{lib, config, pkgs, ...}:
{
  options.myModules.quteBrowser.enable = lib.mkEnableOption "enables qutebrowser module";

  config = lib.mkIf config.myModules.quteBrowser.enable {
    programs.qutebrowser = {
      enable = true;

      extraConfig = ''
        config.set('colors.webpage.darkmode.enabled', False, 'file://*')
        config.set('colors.webpage.darkmode.enabled', False, 'https://docs.google.com/*')

        #privacy

        config.set("content.webgl", False, "*")
        config.set("content.canvas_reading", False)
        config.set("content.geolocation", False)
        config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
        config.set("content.cookies.accept", "all")
        config.set("content.cookies.store", True)

        # Configuraciones para Google Meet (si también las necesitas)
        config.set('content.media.audio_capture', True, 'https://meet.google.com/*')
        config.set('content.media.audio_video_capture', True, 'https://meet.google.com/*')
        config.set('content.media.video_capture', True, 'https://meet.google.com/*')
        config.set('content.notifications.enabled', True, 'https://meet.google.com/*')
      '';
      
      settings = {
        colors.webpage.darkmode = {
          enabled = true;
          algorithm = "lightness-cielab";
          policy.images = "never";
        };
        auto_save.session = true;
      };
      searchEngines = {
        yt = "https://www.youtube.com/results?search_query={}";
        np = "https://search.nixos.org/packages?channel=unstable&type=packages&query={}";
      };

      greasemonkey = [
        (pkgs.writeText "yt-ads.js" ''
          // ==UserScript==
        // @name         Auto Skip YouTube Ads
        // @version      1.1.0
        // @description  Speed up and skip YouTube ads automatically
        // @author       jso8910 and others
        // @match        *://*.youtube.com/*
        // ==/UserScript==


        document.addEventListener('load', () => {
            const btn = document.querySelector('.videoAdUiSkipButton,.ytp-ad-skip-button-modern')
            if (btn) {
                btn.click()
            }
            const ad = [...document.querySelectorAll('.ad-showing')][0];
            if (ad) {
                document.querySelector('video').currentTime = 9999999999;
            }
        }, true);
        '')
      ];
    };
  };
}

