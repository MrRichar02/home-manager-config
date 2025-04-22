{lib, config, ...}:
{
  options.myModules.yazi.enable = lib.mkEnableOption "enables yazi module";

  config = lib.mkIf config.myModules.yazi.enable {
    programs.yazi = {
      enable = true;
      keymap = {
        manager.append_keymap = [
          { run = "cd ~/Documents/sexto-semestre/"; on = ["g" "s"]; }
        ];
      };
    };
  };
}
