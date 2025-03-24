{ pkgs, ... }:
{ 
  programs.helix = { 

    enable = true; 
    
    settigs = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
    };

  }; 
}

