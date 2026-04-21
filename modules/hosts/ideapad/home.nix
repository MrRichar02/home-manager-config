{
  self,
  inputs,
  ...
}: {
  flake.homeModules.ideapad-home = {pkgs, ...}:{
    home = {
      # Home Manager needs a bit of information about you and the
      # paths it should manage.
      username = "docair";
      homeDirectory = "/home/docair";

      # This value determines the Home Manager release that your
      # configuration is compatible with. This helps avoid breakage
      # when a new Home Manager release introduces backwards
      # incompatible changes.
      #
      # You can update Home Manager without changing this value. See
      # the Home Manager release notes for a list of state version
      # changes in each release.
      stateVersion = "24.11";
    };

    imports = [
     self.homeModules.ideapad-pkgs

		 self.homeModules.bash

		 self.homeModules.direnv
		 self.homeModules.git
		 self.homeModules.tmux

		 self.homeModules.rofi
		 self.homeModules.starship
		 self.homeModules.mpv

		 self.homeModules.qutebrowser

		 self.homeModules.kitty
		 
		 self.homeModules.swww
		 self.homeModules.swaync
    ];

    # Styles
    myModules.stylix.enable = true;

    # wayland compositor mangowc
    myModules.waybar = {
      enable = true;
      compositor = "mango";
    };

    programs.nix-index-database.comma.enable = true;

    gtk.cursorTheme = {
      package = pkgs.rose-pine-cursor;
      name = "BreezeX-RosePine-Linux";
      size = 24;
    };

    # home.sessionVariables = {
    #   EDITOR = "neovim";
    # };

    #Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
