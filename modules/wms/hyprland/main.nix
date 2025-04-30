{lib, config, ...}:
{
  options.myModules.hyprland1.enable = lib.mkEnableOption "enables main module for hyprland config 1";

  config = lib.mkIf config.myModules.hyprland1.enable {
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
      };
    };
  };
}
