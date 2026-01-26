{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.myModules.waybar;
in {
  options.myModules.waybar = {
    enable = lib.mkEnableOption "Enables or disables waybar custom module";
    isHyprland = lib.mkEnableOption "Enable waybar support for wayland compositor hyprland";
    isMango = lib.mkEnableOption "Enable waybar support for wayland compositor mango";
  };
  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          spacing = 0;
          modules-left = [] ++ lib.optionals cfg.isHyprland ["hyprland/workspaces"];
          modules-center = ["clock"];
          modules-right = [
            "tray"
            "wireplumber"
            "wireplumber#source"
            "network"
            "backlight"
            "cpu"
            "memory"
            "battery"
          ];

          "hyprland/workspaces" = {
            "disable-scroll" = true;
            "all-outputs" = true;
            "warp-on-scroll" = false;
            "format" = "{name}: {icon}";
            "format-icons" = {
              "urgent" = "";
              "active" = "";
              "persistent" = "";
            };
            "persistent-workspaces" = {
              "*" = 10;
            };
          };

          "tray" = {
            # // "icon-size": 21,
            "spacing" = 10;
            # // "icons": {
            # //   "blueman": "bluetooth",
            # //   "TelegramDesktop": "$HOME/.local/share/icons/hicolor/16x16/apps/telegram.png"
            # // }
          };

          "clock" = {
            # // "tooltip-format": "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>",
            "format-alt" = "{:%Y-%m-%d}";
            "format" = "{:%R %h %d}";
            "tooltip-format" = "<tt><small>{calendar}</small></tt>";
            "calendar" = {
              "mode" = "year";
              "mode-mon-col" = 3;
              "weeks-pos" = "right";
              "on-scroll" = 1;
              "format" = {
                "months" = "<span color='#ffead3'><b>{}</b></span>";
                "days" = "<span color='#ecc6d9'><b>{}</b></span>";
                "weeks" = "<span color='#99ffdd'><b>W{}</b></span>";
                "weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
                "today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
            # // "actions":  {
            # // 	"on-click-right": "mode",
            # // 	"on-scroll-up": "tz_up",
            # // 	"on-scroll-down": "tz_down",
            # // 	"on-scroll-up": "shift_up",
            # // 	"on-scroll-down": "shift_down"
            # // }
          };

          "cpu" = {
            "format" = "{usage}% ";
            "tooltip" = false;
          };
          "memory" = {
            "format" = "{}% ";
          };
          "backlight" = {
            # // "device"= "acpi_video1";
            "format" = "{percent}% {icon}";
            "format-icons" = ["" "" "" "" "" "" "" "" ""];
            "on-click" = "hyprsunset -t 5000";
            "on-click-right" = "pkill hyprsunset";
          };

          "battery" = {
            "states" = {
              # // "good"= 95;
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{capacity}% {icon}";
            "format-full" = "{capacity}% {icon}";
            "format-charging" = "{capacity}% ";
            "format-plugged" = "{capacity}% ";
            "format-alt" = "{time} {icon}";
            # // "format-good"= ""; // An empty format will hide the module
            # // "format-full"= "";
            "format-icons" = ["" "" "" "" ""];
          };

          "network" = {
            # // "interface"= "wlp2*"; // (Optional) To force the use of this interface
            "format-wifi" = "{essid} ({signalStrength}%) ";
            "format-ethernet" = "{ipaddr}/{cidr} ";
            "tooltip-format" = "{ifname} via {gwaddr} ";
            "format-linked" = "{ifname} (No IP) ";
            "format-disconnected" = "Disconnected ⚠";
            "format-alt" = "{ifname}: {ipaddr}/{cidr}";
          };

          "wireplumber" = {
            "format" = "{volume}% {icon}";
            "format-muted" = "";
            "on-click" = "helvum";
            "on-click-right" = "kitty --detach --class wiremix wiremix";
            "format-icons" = ["" "" ""];
          };
          "wireplumber#source" = {
            "node-type" = "Audio/Source";
            "format" = "{volume}% 󰍬";
            "format-muted" = "󰍭";
            "on-click-right" = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
            "scroll-step" = 5;
          };

          "custom/hello-from-waybar" = {
            format = "hello {}";
            max-length = 40;
            interval = "once";
            exec = pkgs.writeShellScript "hello-from-waybar" ''
              echo "from within waybar"
            '';
          };
        };
      };
    };
  };
}
