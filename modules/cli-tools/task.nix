{
  pkgs,
  lib,
  config,
  ...
}: {
  options.myModules.taskwarrior.enable = lib.mkEnableOption "enables taskwarrior module";

  config = lib.mkIf config.myModules.taskwarrior.enable {
    programs.taskwarrior = {
      enable = true;
      package = pkgs.taskwarrior3;
      dataLocation = "$HOME/tasks";
    };
  };
}
