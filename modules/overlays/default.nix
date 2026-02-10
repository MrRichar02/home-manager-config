{
  inputs,
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    inputs.kickstart-nix.overlays.default

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
            ];
          });
      in
        pkgs.writeShellScriptBin "utilities-menu" ''
          exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
        '';
    })

    # (final: prev: {
    #   waypaper = prev.waypaper.overrideAttrs (old: rec {
    #     version = "2.7";
    #     src = old.src.override {
    #       tag = version;
    #       hash = "sha256-wtYF9H56IARkrFbChtuhWtOietA88khQJSOpfDtGQro=";
    #     };
    #   });
    # })

    (final: prev: {
      clipse = prev.clipse.overrideAttrs (old: rec {
        version = "1.2.1";
        src = old.src.override {
          rev = "v${version}";
          hash = "sha256-iDMHEhYuxspBYG54WivnVj2GfMxAc5dcrjNxtAMhsck=";
        };
        vendorHash = "sha256-rq+2UhT/kAcYMdla+Z/11ofNv2n4FLvpVgHZDe0HqX4=";
        tags = ["wayland"];
      });
    })

    (final: prev: {
      mars-mips = prev.mars-mips.overrideAttrs (old: {
        installPhase =
          old.installPhase
          + ''

            # Rehacer el wrapper con las variables
            			 wrapProgram $out/bin/Mars \
            			 --set _JAVA_AWT_WM_NONREPARENTING "1" \
            			 --set _JAVA_OPTIONS "-Dsun.java2d.opengl=false -Dsun.java2d.xrender=false"

          '';
      });
    })

    (final: prev: {
      logisim-evolution = prev.logisim-evolution.overrideAttrs (old: {
        installPhase =
          old.installPhase
          + ''

            # Rehacer el wrapper con las variables
            			 wrapProgram $out/bin/logisim-evolution \
            			 --set _JAVA_AWT_WM_NONREPARENTING "1" \
            			 --set _JAVA_OPTIONS "-Dsun.java2d.opengl=false -Dsun.java2d.xrender=false"

          '';
      });
    })
  ];
}
