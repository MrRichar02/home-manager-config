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
    tmux.enable = true;
    yazi.enable = true;
    git.enable = true;
    rofi.enable = true;
    starship.enable = true;

    waybar-mango.enable = true;

    bash.enable = true;

    stylix.enable = false;

    kitty.enable = true;

    onlyOffice.enable = false;

    taskwarrior.enable = true;

    quteBrowser.enable = true;

    mpv.enable = true;

		obsidian.enable = true;

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
