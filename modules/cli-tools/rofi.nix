{lib, config, pkgs, ...}:
{
  options.myModules.rofi.enable = lib.mkEnableOption "enables rofi module";

  config = lib.mkIf config.myModules.rofi.enable {

    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland.override { plugins = [pkgs.rofi-emoji-wayland]; };
    };
  };
}
