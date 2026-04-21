{
  lib,
  config,
  pkgs,
  ...
}: {
  options.myModules.mpv.enable = lib.mkEnableOption "enables mpv module";

  config = lib.mkIf config.myModules.mpv.enable {
    programs.mpv = {
      enable = true;
      package = pkgs.mpv-unwrapped.wrapper {
        mpv = pkgs.mpv-unwrapped.override {vapoursynthSupport = true;};
        youtubeSupport = true;
      };
    };
  };
}
