{pkgs, ...}:
{
  programs.vscode = {
    enable = true; 
    profiles.default.extensions = with pkgs.vscode-extensions; [
      ms-toolsai.jupyter
      vscodevim.vim
      ms-python.python
    ];
  };
}
