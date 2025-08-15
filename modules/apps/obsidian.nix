{
  lib,
  config,
  ...
}: {
  options.myModules.obsidian.enable = lib.mkEnableOption "enables obsidian module";

  config = lib.mkIf config.myModules.obsidian.enable {
    programs.obsidian = {
      enable = true;
      defaultSettings.app = {
        vimMode = true;
        showLineNumber = true;
        attachmentFolderPath = "./attachments";
      };
      vaults."Documents/obsidian-notes".enable = true;
    };
  };
}
