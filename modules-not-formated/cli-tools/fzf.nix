{
  lib,
  config,
  ...
}: {
  options.myModules.fzf.enable = lib.mkEnableOption "enables fzf module";

  config = lib.mkIf config.myModules.fzf.enable {
    programs.fzf = {
      enable = true;
    };
  };
}
