{
  lib,
  config,
  ...
}: {
  options.myModules.fastfetch.enable = lib.mkEnableOption "enables fastfetch";

  config = lib.mkIf config.myModules.fastfetch.enable {
    programs.fastfetch = {
      enable = true;
    };
  };
}
