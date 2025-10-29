{lib, config, ...}:
{
  options.myModules.git.enable = lib.mkEnableOption "enables git module";

  config = lib.mkIf config.myModules.git.enable {

    programs.git = {
      enable = true;
      settings = {
        user.email = "richarmamadi03@gmail.com";
        user.name = "MrRichar02";
        init.defaultBranch = "main";
      };
    };
  };
}
