{lib, config, pkgs, ...}:
{
  options.myModules.rofi.enable = lib.mkEnableOption "enables rofi module";

  config = lib.mkIf config.myModules.rofi.enable {

    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      plugins = [
        pkgs.rofi-emoji-wayland
      ];
      theme = "fullscreen-preview by Dave Davenport";
    };
  };
}
