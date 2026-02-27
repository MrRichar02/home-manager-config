{
  pkgs,
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    # See https://wiki.hypr.land/Configuring/Gestures
    gesture = [
      "3, horizontal, workspace"
    ];

    ###################
    ### KEYBINDINGS ###
    ###################

    # See https://wiki.hypr.land/Configuring/Keywords/
    "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier

    # Example binds, see https://wiki.hypr.land/Configuring/Binds/ for more
    bind = let
      zoomScript = pkgs.writeShellScript "zoomScript" ''
        is_zoom_in=$(hyprctl getoption cursor:zoom_factor | head -n1 | awk '{print $2}' | awk '{print ($1>1)}')

        if [ $is_zoom_in -eq 1 ]; then
        	hyprctl keyword cursor:zoom_factor 1
        else
        	hyprctl keyword cursor:zoom_factor 1.6
        		fi
      '';
      specialWorkspaceScript = pkgs.writeShellScript "specialWorkspaceScript" ''
        workspace_name=$(hyprctl monitors -j | ${lib.getExe pkgs.jq} -r ".[0].specialWorkspace.name" | awk -F ':' '{print $2}')

        if [ -n "$workspace_name" ]; then
        	hyprctl dispatch togglespecialworkspace $workspace_name
        fi
      '';
    in [
      "$mainMod, Return, exec, $terminal"
      "$mainMod, Q, killactive,"
      "$mainMod, M, exit,"
      "$mainMod, E, exec, $fileManager"
      "$mainMod, Z, exec, ${zoomScript}"
      "$mainMod, U, exec, ${lib.getExe pkgs.utilities-menu}"
      "$mainMod, Y, exec, ${lib.getExe pkgs.layouts-hyprland-menu}"
      "$mainMod, W, exec, $browser"
      "$mainMod, F, togglefloating,"
      "$mainMod SHIFT, F, fullscreen,"
      "ALT, F, fullscreenstate, 0 1"
      "$mainMod, D, exec, $menu"
      # bind = $mainMod, P, pseudo, # dwindle
      # bind = $mainMod, J, togglesplit, # dwindle


      # Move focus with mainMod + arrow keys
      "$mainMod, L, movefocus, r"
      "$mainMod, H, movefocus, l"
      "$mainMod, K, movefocus, u"
      "$mainMod, J, movefocus, d"

      # Move window with mainMod + arrow keys
      "$mainMod SHIFT, L, movewindow, r"
      "$mainMod SHIFT, H, movewindow, l"
      "$mainMod SHIFT, K, movewindow, u"
      "$mainMod SHIFT, J, movewindow, d"

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
      # "$mainMod, S, togglespecialworkspace, magic"

      # scratchpads
      "$mainMod, S, exec, ${lib.getExe pkgs.scratchpads-hyprland-menu}"
      "$mainMod SHIFT, S, exec, ${specialWorkspaceScript}"

      "$mainMod, N, togglespecialworkspace, redhat"
      "$mainMod SHIFT, N, movetoworkspace, special:magic"

      # ClipboardManager + Color picker
      "$mainMod, C, exec, ${pkgs.kitty}/bin/kitty --title floatingTui -e '${pkgs.clipse}/bin/clipse'"
      "$mainMod SHIFT, C, exec, ${pkgs.hyprpicker}/bin/hyprpicker | ${pkgs.wl-clipboard}/bin/wl-copy -n"

      # Scroll through existing workspaces with mainMod + scroll
      "$mainMod, mouse_down, workspace, e+1"
      "$mainMod, mouse_up, workspace, e-1"
    ];

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = [
      "$mainMod, mouse:272, movewindow"
      "$mainMod, mouse:273, resizewindow"
    ];

    # Laptop multimedia keys for volume and LCD brightness
    bindel = [
      ",XF86AudioRaiseVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
      ",XF86AudioLowerVolume, exec, ${pkgs.wireplumber}/bin/wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ",XF86AudioMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ",XF86AudioMicMute, exec, ${pkgs.wireplumber}/bin/wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ",XF86MonBrightnessUp, exec, ${pkgs.brightnessctl}/bin/brightnessctl -e4 -n2 set 5%+"
      ",XF86MonBrightnessDown, exec, ${pkgs.brightnessctl}/bin/brightnessctl -e4 -n2 set 5%-"
    ];

    # Requires playerctl
    bindl = [
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPause, exec, playerctl play-pause"
      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioPrev, exec, playerctl previous"

      # Screenshot
      ", Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -z --clipboard-only"
      "$mainMod, Print, exec, ${pkgs.hyprshot}/bin/hyprshot -m region -z -o $HOME/Pictures/screenshots/"
    ];
  };
}
