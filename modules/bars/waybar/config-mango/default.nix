{
  lib,
  config,
  pkgs,
  ...
}:
let
backlight-script = pkgs.writeShellScriptBin "backlight-script" ''
PROCESS_NAME="hyprsunset"
if pgrep "$PROCESS_NAME" > /dev/null; then
  pkill -f "$PROCESS_NAME"
	${pkgs.libnotify}/bin/notify-send -t 1300 -i "" "Blue light OFF"
else
  ${pkgs.hyprsunset}/bin/hyprsunset --temperature 5000 &
	${pkgs.libnotify}/bin/notify-send -t 1300 -i "" "Blue light ON"
fi
'';

in
{
  options.myModules.waybar-mango.enable = lib.mkEnableOption "enables waybar module";

  config = lib.mkIf config.myModules.waybar-mango.enable {
    home.packages = with pkgs; [helvum monocraft backlight-script];

    fonts.fontconfig.enable = true;

    programs.waybar = {
      enable = true;
      style = ./style.css;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 36;

          modules-left = ["ext/workspaces" "dwl/tags"];
          modules-center = ["clock"];
          modules-right = ["tray" "backlight" "pulseaudio" "wireplumber" "network" "battery"];

          # "custom/nixos-btw" = {
          #     "format" = "i use nixos btw ";
          #     "tooltip" = false;
          # };

					"ext/workspaces"= {
						"format"= "{icon}";
						"ignore-hidden"= true;
						"on-click"= "activate";
						"sort-by-id"= true;
					};
					"dwl/tags"= {
						"num-tags"=10;
					};

          "backlight" = {
            "device" = "intel_backlight";
            "format" = "{percent}% {icon}";
            "format-icons" = ["" ""];
						"on-click" = "backlight-script";
          };

          "wireplumber" = {
            "format" = "{volume}% {icon}";
            "format-muted" = "";
            "on-click" = "helvum";
            "format-icons" = ["" "" ""];
          };

          "pulseaudio" = {
            "format" = "{format_source}";
            "format-source" = "{volume}% ";
            "format-source-muted" = "";
            "on-click" = "wpctl set-volume @DEFAULT_AUDIO_SOURCE@ 70%";
          };

          # "hyprland/window" = {
          #   "format" = "👉 {}";
          #   #"separate-outputs" = true;
          # };

          "battery" = {
            "format" = "{capacity}% {icon}";
            "format-icons" = ["" "" "" "" ""];
          };

          "clock" = {
            format = "{:%A, %B %d at %R}";
            format-alt = "{:%d.%m.%Y - %H:%M}";
          };

          # clock = {
          #   format = "{:%H:%M} ";
          #   format-alt = "{:%A, %B %d, %Y (%R)} ";
          #   tooltip-format = "<tt><small>{calendar}</small></tt>";
          #   calendar = {
          #     mode           = "year";
          #     mode-mon-col   = 3;
          #     weeks-pos      = "right";
          #     on-scroll      = 1;
          #     format = {
          #       months =     "<span color='#ffead3'><b>{}</b></span>";
          #       days =       "<span color='#ecc6d9'><b>{}</b></span>";
          #       weeks =      "<span color='#99ffdd'><b>W{}</b></span>";
          #       weekdays =   "<span color='#ffcc66'><b>{}</b></span>";
          #       today =      "<span color='#ff6699'><b><u>{}</u></b></span>";
          #     };
          #   };
          #   actions = {
          #     on-click-right = "mode";
          #     on-scroll-up = "tz_up";
          #     on-scroll-down = "tz_down";
          #   };
          # };

          "tray" = {
            "icon-size" = 21;
            "spacing" = 10;
          };

          "user" = {
            "format" = "{user} up {work_H}H";
            "interval" = 60;
            "height" = 30;
            "width" = 30;
            "icon" = true;
          };

          "network" = {
            # "interface" = "wlp2*"; // (Optional) To force the use of this interface
            "format-wifi" = "({signalStrength}%) ";
            "format-ethernet" = "{signalStrength}%) ";
            "tooltip-format" = "{ifname} via {gwaddr} ";
            "format-linked" = "{ifname} (No IP) ";
            "format-disconnected" = "Disconnected ⚠";
            "format-alt" = "{ifname} = {ipaddr}/{cidr}";
          };

          # "custom/weather" = {
          #     format = " {} ";
          #     exec = "curl -s 'wttr.in/?format=%c%t%20%C'";
          #     interval = 300;
          #     class = "weather";
          # };

          # "cpu" = {
          #   "format" = "{usage}% ";
          #   "tooltip" = false;
          # };
          #
          # "memory" = {
          #   "interval" = 30;
          #   "format" = "{used: 0.1f}G/{total: 0.1f}G ";
          # };

          # "pulseaudio" = {
          #   "format" = "{volume}% {icon}";
          #   "format-bluetooth" = "{volume}% {icon}";
          #   "format-muted" = "";
          #   "format-icons" = {
          #     "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
          #     "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
          #     "headphone" = "";
          #     "hands-free" = "";
          #     "headset" = "";
          #     "phone" = "";
          #     "phone-muted" = "";
          #     "portable" = "";
          #     "car" = "";
          #     "default" = ["" ""];
          #   };
          #   "scroll-step" = 1;
          #   "on-click" = "pavucontrol";
          #   "ignored-sinks" = ["Easy Effects Sink"];
          # };
          #
        };
      };
    };
  };
}
