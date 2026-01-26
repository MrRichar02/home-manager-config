{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.myModules.hyprland.pyprland;
in {
  options.myModules.hyprland.pyprland = {
    enable = lib.mkEnableOption "Enables or disables pyprland custom config";
  };

  config = lib.mkIf cfg.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "${pkgs.pyprland}/bin/pypr"
      ];

      bind = [
        "$mainMod, Z, exec, ${pkgs.pyprland}/bin/pypr zoom"
      ];
    };

    xdg.configFile."hypr/pyprland.toml" = {
      text = ''
        [pyprland]
        plugins = [
        	"magnify",
        ]
      '';
    };
  };
}
