{
  pkgs,
  lib,
  config,
  ...
}: {
  options.myModules.nnn.enable = lib.mkEnableOption "enables nnn module";

  config = lib.mkIf config.myModules.nnn.enable {
    programs.nnn = {
      enable = true;

      package = pkgs.nnn.override {
        withNerdIcons = true;
      };

      extraPackages = with pkgs; [
        ffmpegthumbnailer
        mediainfo
        sxiv
      ];

      plugins = {
        src =
          (pkgs.fetchFromGitHub {
            owner = "jarun";
            repo = "nnn";
            rev = "v4.0";
            sha256 = "sha256-Hpc8YaJeAzJoEi7aJ6DntH2VLkoR6ToP6tPYn3llR7k=";
          })
          + "/plugins";

        mappings = {
          c = "fzcd";
          f = "finder";
          v = "imgview";
        };
      };
    };
  };
}
