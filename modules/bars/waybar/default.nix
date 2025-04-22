{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 36;

        modules-left = [ "custom/os_icon" "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "custom/weather" "pulseaudio" "network" "clock" "battery" ];

        "custom/os_icon" = {
          "format" = "";
          "tooltip" = false;
        };

        "hyprland/workspaces" = {
          "format" = "{name} {icon}";
          "format-icons" = {
            "1" = "";
            "2" = "";
            "3" = "";
            "5" = "";
            "6" = "";
            "8" = "󱓧";
            "9" = "󰋀";
            "10" = "";
            "active" = "";
            "default" = "󰒲";
          };
          "persistent-workspaces" = {
            "*" = 10; # 5 workspaces by default on every monitor
          };
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
          format = "{:%d.%m.%Y - %H:%M}";
          format-alt = "{:%A, %B %d at %R}";
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

        "network" = {
          # "interface" = "wlp2*"; // (Optional) To force the use of this interface
          "format-wifi" = "{essid} ({signalStrength}%) ";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "Disconnected ⚠";
          "format-alt" = "{ifname} = {ipaddr}/{cidr}";
        };

        "custom/weather" = {
          format = " {} ";
          exec = "curl -s 'wttr.in/Rionegro+Antioquia?format=%c%t'";
          interval = 300;
          class = "weather";
        };

        # "cpu" = {
        #   "format" = "{usage}% ";
        #   "tooltip" = false;
        # };
        #
        # "memory" = {
        #   "interval" = 30;
        #   "format" = "{used: 0.1f}G/{total: 0.1f}G ";
        # };

        "pulseaudio" = {
          "format" = "{volume}% {icon}";
          "format-bluetooth" = "{volume}% {icon}";
          "format-muted" = "";
          "format-icons" = {
            "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
            "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "phone-muted" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" ""];
          };
          "scroll-step" = 1;
          "on-click" = "pavucontrol";
          "ignored-sinks" = ["Easy Effects Sink"];
        };
      };
    };

  };
}
