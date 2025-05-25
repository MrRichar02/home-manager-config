{lib, config, pkgs, ...}:
{
  options.myModules.quteBrowser.enable = lib.mkEnableOption "enables qutebrowser module";

  config = lib.mkIf config.myModules.quteBrowser.enable {
    programs.qutebrowser = {
      enable = true;

      extraConfig = ''
        config.set('colors.webpage.darkmode.enabled', False, 'file://*')
        config.set('colors.webpage.darkmode.enabled', False, 'https://docs.google.com/*')
        config.set('colors.webpage.darkmode.enabled', False, 'https://app.diagrams.net/*')
        config.set('colors.webpage.darkmode.enabled', False, 'https://excalidraw.com/*')

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
        spellcheck.languages = [ "en-US" "es-ES" ];
      };
      searchEngines = {
        yt = "https://www.youtube.com/results?search_query={}";
        np = "https://search.nixos.org/packages?channel=unstable&type=packages&query={}";
        hm = "https://home-manager-options.extranix.com/?query={}&release=master";
      };

      quickmarks = {
        bitwarden = "https://vault.bitwarden.com/#/vault";
        udearroba = "https://udearroba.udea.edu.co/internos/my/";
        ingenia = "https://virtualingenieriaudea.co/my/";
        gmail = "https://mail.google.com/mail/u/0/#inbox";
        fundamentos = "https://udea.zoom.us/j/96066678530";
        arqui = "https://udearroba.zoom.us/j/93613150158";
        comu1 = "https://udearroba.zoom.us/j/91952714313";
        db = "https://udearroba.zoom.us/j/99971686698";
        proyecto1 = "https://udearroba.zoom.us/j/99830580258";
        modelos1 = "https://udea.zoom.us/j/91785418283";
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

