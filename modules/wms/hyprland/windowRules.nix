{
  lib,
  config,
  ...
}: {
  options.myModules.hyprland1.windowRules.enable = lib.mkEnableOption "enables windows rules for hyprland config 1";

  config = lib.mkIf config.myModules.hyprland1.windowRules.enable {
    wayland.windowManager.hyprland.settings = {
      windowrulev2 = [
        "workspace 5 silent, class:ZapZap"
        "workspace 8 silent, class:obsidian"
        "workspace 9 silent, class:zoom, title:Meeting"
        "workspace 10, class:spotify"
        "workspace 10, class:com.github.th_ch.youtube_music"
        # "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];
    };
  };
}
