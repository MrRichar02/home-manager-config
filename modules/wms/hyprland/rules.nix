{
  pkgs,
  lib,
  config,
  ...
}: {
  wayland.windowManager.hyprland.settings = {
    ##############################
    ### WINDOWS AND WORKSPACES ###
    ##############################

    # See https://wiki.hypr.land/Configuring/Window-Rules/ for more
    # See https://wiki.hypr.land/Configuring/Workspace-Rules/ for workspace rules

    # Example windowrule
    windowrule = [
      # windowrule = float,class:^(kitty)$,title:^(kitty)$
      "workspace 5 silent, class:ZapZap"
      "workspace 5 silent, class:vesktop"
      "workspace 10 silent, title:.*YouTube Music.*"
      "workspace 9 silent, title:.*udearroba.zoom.us.*"

      # Ignore maximize requests from apps. You'll probably like this.
      "suppressevent maximize, class:.*"

      # Fix some dragging issues with XWayland
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];

    windowrulev2 = [
      "float,title:(floatingTui)" # ensure you have a floating window class set if you want this behavior
      "size 1700 1000,title:(floatingTui)" # set the size of the window as necessary
    ];
  };
}
