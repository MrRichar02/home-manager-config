{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      utilities-menu = let
        configFile =
          pkgs.writeText "config.yaml"
          (lib.generators.toYAML {} {
            anchor = "center";

            menu = [
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
          });
      in
        pkgs.writeShellScriptBin "utilities-menu" ''
          exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
        '';
    })
  ];
}
