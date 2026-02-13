{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      scratchpads-hyprland-menu = let
        configFile =
          pkgs.writeText "config.yaml"
          (lib.generators.toYAML {} {
            anchor = "center";

            menu = [
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
          });
      in
        pkgs.writeShellScriptBin "scratchpads-hyprland-menu" ''
          exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
        '';
    })
  ];
}
