{lib, config, ...}:
{
  options.myModules.hyprland1.windowRules.enable = lib.mkEnableOption "enables windows rules for hyprland config 1";

  config = lib.mkIf config.myModules.hyprland1.windowRules.enable {
    wayland.windowManager.hyprland.settings = {
      windowrulev2 = [
        "workspace 5 silent, class:ZapZap"
        "workspace 8 silent, class:obsidian"
        "workspace 10, class:spotify"
      ];
    };
  };
}
