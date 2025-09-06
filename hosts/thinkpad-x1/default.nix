{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "docair";
  home.homeDirectory = "/home/docair";

  imports = [
    ./packages.nix
  ];

	programs.btop = {
		enable = true;
	};

  myModules = {
    fastfetch.enable = true;
    tmux.enable = true;
    yazi.enable = true;
    git.enable = true;
    rofi.enable = true;
    starship.enable = true;

    vscode.enable = true;

    waybar.enable = true;

    bash.enable = true;

    zoxide.enable = true;

    hyprland1 = {
      enable = true;
      animations.enable = true;
      keybinds.enable = true;
      windowRules.enable = true;
    };

    stylix.enable = true;

    kitty.enable = true;

    onlyOffice.enable = true;

    taskwarrior.enable = true;

    quteBrowser.enable = true;

    mpv.enable = true;

    obs.enable = false;

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

  # home.sessionVariables = {
  #   EDITOR = "neovim";
  # };

  #Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
