{lib, config, ...}:
{
  options.myModules.ranger.enable = lib.mkEnableOption "enables ranger module";

  config = lib.mkIf config.myModules.ranger.enable {
    programs.ranger = {
      enable = true;
      settings = {
        "preview_images" = true;
        "preview_images_method" = "kitty";
      };
    };
  };
}
