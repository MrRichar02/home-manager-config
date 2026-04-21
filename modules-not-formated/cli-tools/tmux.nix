{
  pkgs,
  lib,
  config,
  ...
}: {
  options.myModules.tmux.enable = lib.mkEnableOption "enables tmux module";

  config = lib.mkIf config.myModules.tmux.enable {
    programs.tmux = {
      enable = true;

      escapeTime = 0;
      mouse = true;

      prefix = "C-s";
      keyMode = "vi";
      customPaneNavigationAndResize = true;
      baseIndex = 1;

      terminal = "screen-256color";

      extraConfig = ''
                set-option -g status-position top
                set-option -g status-justify absolute-centre

        # with alt
        				bind -n M-h select-pane -L
        				bind -n M-j select-pane -D
        				bind -n M-k select-pane -U
        				bind -n M-l select-pane -R

        # move between windows
        				bind -n M-1 select-window -t 1
        				bind -n M-2 select-window -t 2
        				bind -n M-3 select-window -t 3
        				bind -n M-4 select-window -t 4
        				bind -n M-5 select-window -t 5
        				bind -n M-6 select-window -t 6
        				bind -n M-7 select-window -t 7
        				bind -n M-8 select-window -t 8
        				bind -n M-9 select-window -t 9

        # panes
        				unbind %
        				unbind '"'
        				bind | split-window -h -c "#{pane_current_path}"
        				bind - split-window -v -c "#{pane_current_path}"

        # copy mode
        				set-window-option -g mode-keys vi
        				bind-key -T copy-mode-vi v send-keys -X begin-selection
        				bind-key -T copy-mode-vi c-v send-keys -X rectangle-toggle
        				bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
        				unbind -T copy-mode-vi MouseDragEnd1Pane
      '';
    };
  };
}
