{
  pkgs,
  lib,
  config,
  ...
}: {
  options.myModules.vscode.enable = lib.mkEnableOption "enables vscode module";

  config = lib.mkIf config.myModules.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscodium;
			mutableExtensionsDir = true;
      profiles.default.extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        ms-python.python
        ms-toolsai.jupyter
        github.copilot
        github.copilot-chat
        pkief.material-icon-theme
      ];
      profiles.default.userSettings = {
        "chat.disableAIFeatures" = false;
      };
    };
  };
}
