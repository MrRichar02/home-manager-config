{ pkgs, lib, config, ...}:

{
  options.myModules.tmux.enable = lib.mkEnableOption "enables tmux module";

  config = lib.mkIf config.myModules.tmux.enable {
    programs.tmux = {
      enable = true; 

      prefix = "C-a";

      keyMode = "vi";

      extraConfig = '' 
      set -g mouse on

      set -g base-index 1
      setw -g pane-base-index 1

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      set-option -g status-position top
      '';
    };
  };
}
