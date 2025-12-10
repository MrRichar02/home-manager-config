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
        readableLineLength = false;
      };
      vaults."Documents/obsidian-notes".enable = true;
    };
  };
}
