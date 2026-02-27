{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
    (final: prev: {
      layouts-hyprland-menu = let
        configFile =
          pkgs.writeText "config.yaml"
          (lib.generators.toYAML {} {
            anchor = "center";

            menu = [
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
          });
      in
        pkgs.writeShellScriptBin "layouts-hyprland-menu" ''
          exec ${lib.getExe pkgs.wlr-which-key} ${configFile}
        '';
    })
  ];
}
