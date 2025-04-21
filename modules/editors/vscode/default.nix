{pkgs, ...}:
{
  programs.vscode = {
    enable = true; 
    profiles.default.extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      ms-python.python
      batisteo.vscode-django
    ];
  };
}
