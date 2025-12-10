{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "docair";
  home.homeDirectory = "/home/docair";

  imports = [
    ./packages.nix
  ];

  xdg.mime.enable = true;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = ["onlyoffice-desktopeditors.desktop"];
      "text/html" = ["org.qutebrowser.qutebrowser.desktop"];
      "x-scheme-handler/http" = ["org.qutebrowser.qutebrowser.desktop"];
      "x-scheme-handler/https" = ["org.qutebrowser.qutebrowser.desktop"];
    };
  };

  myModules = {
    fastfetch.enable = true;
    yazi.enable = true;
    git.enable = true;
    rofi.enable = true;
    starship.enable = true;
    tmux.enable = true;
    direnvnix.enable = true;

    vscode.enable = false;

    waybar-mango.enable = true;

    bash.enable = true;

    zoxide.enable = true;

    # hyprland1 = {
    #   enable = true;
    #   animations.enable = true;
    #   keybinds.enable = true;
    #   windowRules.enable = true;
    # };

    stylix.enable = true;

    kitty.enable = true;

    onlyOffice.enable = false;

    taskwarrior.enable = true;

    quteBrowser.enable = true;

    mpv.enable = true;

    obsidian.enable = true;
  };

  myServices = {
    swaync.enable = true;
    swww.enable = true;
    git-sync-obsidian.enable = false;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  #Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
