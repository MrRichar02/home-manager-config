{lib, config, pkgs, ...}:
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

