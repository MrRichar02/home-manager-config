{
  lib,
  config,
  ...
}: {
  options.myModules.hyprland2.animations.enable = lib.mkEnableOption "enables animations for hyprland config 1";

  config = lib.mkIf config.myModules.hyprland2.animations.enable {
    wayland.windowManager.hyprland.settings = {
      animations.enabled = false;
    };
  };
}
