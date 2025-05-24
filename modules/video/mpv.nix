{lib, config, pkgs, ...}:
{
  options.myModules.mpv.enable = lib.mkEnableOption "enables mpv module";

  config = lib.mkIf config.myModules.mpv.enable {
    programs.mpv = {
      enable = true;
      package = pkgs.mpv-unwrapped.wrapper { mpv =  pkgs.mpv-unwrapped.override { vapoursynthSupport = true; }; youtubeSuport = true; };
      config = {
        profile = "gpu-hq";
        force-window = true;
        ytdl-format = "bestvideo+bestaudio";
        cache-default = 4000000;
      };
    };
  };
}
