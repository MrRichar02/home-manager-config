{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    plugins = with pkgs; [
      hyprlandPlugins.hyprscrolling
    ];
    settings = {
      plugin = {
        hyprscrolling = {
          "fullscreen_on_one_column" = true;
					column_width = 0.8;
        };
      };
      bind = [
        "$mainMod SHIFT, L, layoutmsg, movewindowto r"
        "$mainMod SHIFT, H, layoutmsg, movewindowto l"
        "$mainMod SHIFT, K, layoutmsg, movewindowto u"
        "$mainMod SHIFT, J, layoutmsg, movewindowto d"
      ];
    };
  };
}
