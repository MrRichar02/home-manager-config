{ pkgs, ...}:

{
  programs.tmux = {
    enable = true; 

    plugins = with pkgs; [

      tmuxPlugins.catppuccin
      tmuxPlugins.cpu
    ];

    keyMode = "vi";

    extraConfig = '' 
      set -g mouse on

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g status-position top
    '';
  };
}
