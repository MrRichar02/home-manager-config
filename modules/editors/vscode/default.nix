{pkgs, lib, config, ...}:
{
  options.myModules.vscode.enable = lib.mkEnableOption "enables vscode module";

  config = lib.mkIf config.myModules.vscode.enable {
    programs.vscode = {
      enable = true; 
      profiles.default.extensions = with pkgs.vscode-extensions; [
        vscodevim.vim
        ms-python.python
        batisteo.vscode-django
      ];
    };
  };
}
