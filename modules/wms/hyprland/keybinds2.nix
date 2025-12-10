{
  lib,
  config,
  pkgs,
  ...
}: let
  turnoff-reboot-script = pkgs.writeShellScriptBin "turnoff-reboot-script" ''
    chosen=$(echo -e "Turn off\nReboot" | ${pkgs.rofi}/bin/rofi -dmenu -i -p "Turn off or Reboot xd")
    case "$chosen" in
    	"Turn off")
    		shutdown -h now
    		;;
    	"Reboot")
    		reboot
    		;;
    esac
  '';
  picker-script = pkgs.writeShellScriptBin "picker-script" ''
      chosen=$(echo -e "hex\nrgb\nhsl\nhsv\ncmyk" | ${pkgs.rofi}/bin/rofi -dmenu -i -p "hyprpicker")
    sleep 0.3
    ${pkgs.hyprpicker}/bin/hyprpicker -a -d -f "$chosen"
  '';
in {
  options.myModules.hyprland2.keybinds.enable = lib.mkEnableOption "enables keybinds for hyprland config 1";

  config = lib.mkIf config.myModules.hyprland2.keybinds.enable {
    home.packages = [
      turnoff-reboot-script
      picker-script
    ];
    wayland.windowManager.hyprland.settings = {
      bind = [
        "$mainMod, Return, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating,"
        "$mainMod SHIFT, P, pseudo,"
        "$mainMod, W, exec, $browser"
        "$mainMod, D, exec, $menu"
        "$mainMod, R, exec, turnoff-reboot-script"
        "$mainMod, P, exec, picker-script"
        "$mainMod SHIFT, l, exec, ${pkgs.hyprlock}/bin/hyprlock"

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

        ", Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -z --clipboard-only"
        "$mainMod, Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -z -o $HOME/Pictures/screenshots/"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl s 10%-"
      ];
    };
  };
}
