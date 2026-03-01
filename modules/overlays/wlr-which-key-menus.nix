{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = let
    mkMenu = name: menu: let
      configFile =
        pkgs.writeText "config.yaml"
        (lib.generators.toYAML {} {
          anchor = "center";
          inherit menu;
        });
    in
      pkgs.writeShellScriptBin name ''
        exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
      '';
  in [
    ####################
    ###utilities-menu###
    ####################
    (final: prev: {
      utilities-menu = mkMenu "utilities-menu" [
        {
          cmd = let
            scriptWifi = pkgs.writeShellScript "scriptWifi" ''

              nmcli_output=$(nmcli -t -f SIGNAL,RATE,SSID,BSSID device wifi list | sort -t: -k1 -nr | ${pkgs.fzf}/bin/fzf)
              ssid=$(echo "$nmcli_output" | awk -F: '{print $3}')
              bssid=$(echo "$nmcli_output" | awk -F: '{print $4,$5,$6,$7,$8,$9}' | sed 's/\\ /:/g')
              nmcli connection modify "$ssid" wifi.bssid "$bssid" && nmcli connection down "$ssid" && nmcli connection up "$ssid"

            '';
          in "kitty --detach --title floatingTui ${scriptWifi}";
          desc = "Network menu for changing between wireless networks";
          key = "n";
        }
        {
          cmd = pkgs.writeShellScript "classScript" ''
            class=$(cat "$HOME/.config/rofi/clases.txt" | rofi -dmenu -p 'Udearroba class' | awk -F '  ' '{print $2}')

            if [ "$class" != "" ]; then
            	qutebrowser --target private-window $class
            fi
          '';

          desc = "Clasess launcher";
          key = "c";
        }
        {
          cmd = pkgs.writeShellScript "powerMenu" ''
            selection=$(echo "|" | rofi -dmenu -sep '|')

            if [ "$selection" == "" ]; then
            	shutdown -h now

            		elif [ "$selection" == "" ]; then
            		reboot
            		fi
          '';

          desc = "Power menu (shutdown or reboot)";
          key = "p";
        }
        {
          cmd = "${lib.getExe pkgs.kitty} --detach --title floatingTui ${lib.getExe pkgs.wiremix}";
          desc = "Audio mixer";
          key = "a";
        }
      ];
    })

    ###############################
    ###scratchpads-hyprland-menu###
    ###############################
    (final: prev: {
      scratchpads-hyprland-menu =
        mkMenu "scratchpads-hyprland-menu"
        [
          {
            cmd = "hyprctl dispatch togglespecialworkspace password-manager";
            desc = "Password manager workspace";
            key = "p";
          }
          {
            cmd = "hyprctl dispatch togglespecialworkspace magic";
            desc = "Magic workspace";
            key = "m";
          }
          {
            cmd = "hyprctl dispatch togglespecialworkspace redhat";
            desc = "Redhat workspace";
            key = "r";
          }
          {
            cmd = "hyprctl dispatch movetoworkspace special:password-manager";
            desc = "Move password manager workspace";
            key = "P";
          }
          {
            cmd = "hyprctl dispatch movetoworkspace special:magic";
            desc = "Move to magic workspace";
            key = "M";
          }
          {
            cmd = "hyprctl dispatch movetoworkspace special:redhat";
            desc = "Move to redhat workspace";
            key = "R";
          }
        ];
    })
    ###########################
    ###layouts-hyprland-menu###
    ###########################
    (final: prev: {
      layouts-hyprland-menu = mkMenu "layouts-hyprland-menu" [
        {
          cmd = "hyprctl keyword general:layout scrolling";
          desc = "Set current layout to scrolling";
          key = "s";
        }
        {
          cmd = "hyprctl keyword general:layout dwindle";
          desc = "Set current layout to dwindle";
          key = "d";
        }
      ];
    })
    ###########################
    ###layouts-mango-menu###
    ###########################
    (final: prev: {
      layouts-mango-menu = mkMenu "layouts-mango-menu" [
        {
          cmd = "mmsg -l 'T'";
          desc = "Set current layout to Tiling";
          key = "t";
        }
        {
          cmd = "mmsg -l 'S'";
          desc = "Set current layout to scrolling";
          key = "s";
        }
        {
          cmd = "mmsg -l 'S'";
          desc = "Set current layout to scrolling";
          key = "s";
        }
        {
          cmd = "mmsg -l 'G'";
          desc = "Set current layout to grid";
          key = "g";
        }
        {
          cmd = "mmsg -l 'M'";
          desc = "Set current layout to monocle";
          key = "m";
        }
        {
          cmd = "mmsg -l 'K'";
          desc = "Set current layout to deck";
          key = "k";
        }
        {
          cmd = "mmsg -l 'VT'";
          desc = "Set current layout to vertical tile";
          key = "T";
        }
        {
          cmd = "mmsg -l 'VS'";
          desc = "Set current layout to vertical scrolling";
          key = "S";
        }
        {
          cmd = "mmsg -l 'CT'";
          desc = "Set current layout to center tile";
          key = "c";
        }
      ];
    })
  ];
}
