{
  wayland.windowManager.hyprland = {
    enable = true;


    xwayland.enable = true;

    settings = {

      "$mainMod" = "SUPER";

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$browser" = "zen";
      "$menu" = "rofi -show drun";

      monitor = ",preferred,auto,1";


      env = [
        "NIXOS_OZONE_WL,1"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        # "HYPRCURSOR_THEME,Bibata-Modern-Ice"
        # "HYPRCURSOR_SIZE,24"
      ];

      exec-once = [
        "swww-daemon"
        #"hyprpanel"
        "waybar"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      general = {
        gaps_in = 2;
        gaps_out = 10;

        border_size = 2;

        resize_on_border = true;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 4;

        active_opacity = 1;
        inactive_opacity = 1;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          #color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;

          vibrancy = "0.1696";
        };

      };
      animations = {
        enabled = "yes, please :)";

        animation = [
          "border, 0, 5, default"
          "windows, 1, 5, default"
          "fade, 1, 4, default"
          "workspaces, 1, 4, default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = false;
      };

      input = {
        kb_layout = "latam";

        follow_mouse = 1;

        sensitivity = 0;

        touchpad = {
          natural_scroll = false;
        };


      };
      gestures = {
        workspace_swipe = false;
      };
      device = {
        name = "razer-razer-viper-mini";
        sensitivity = -0.9;
      };

      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, W, exec, $browser"
        "$mainMod, D, exec, $menu"
        "$mainMod SHIFT, l, exec, hyprlock"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        ", Print, exec, hyprshot -m region -z --clipboard-only"
        "$mainMod SHIFT, Print, exec, hyprshot -m region -z -o /home/docair/Pictures/screenshots"
        "$mainMod, Print, exec, hyprshot -m region -z -o ~/Pictures/screenshots/"

      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      windowrulev2 = [
        "workspace 5 silent, class:ZapZap"
        "workspace 8 silent, class:obsidian"
        "workspace 10, class:spotify"
      ];


    };
  };
}
