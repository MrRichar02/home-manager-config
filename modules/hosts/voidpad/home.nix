{
  self,
  inputs,
  ...
}: {
  flake.homeModules.voidpad-home = {
    pkgs,
    nixgl,
    config,
    ...
  }: {

    imports = [
     self.homeModules.voidpad-pkgs

		 self.homeModules.bash

		 self.homeModules.direnv
		 self.homeModules.git
		 self.homeModules.tmux

		 self.homeModules.starship

		 self.homeModules.waybar

		 # self.homeModules.overlay
		 # self.homeModules.overlay-java-apps
		 self.homeModules.overlay-wlr-which-key-menus
    ];

    # Home Manager needs a bit of information about you and the paths it should
    # manage.
    home.username = "docair";
    home.homeDirectory = "/home/docair";

    # This value determines the Home Manager release that your configuration is
    # compatible with. This helps avoid breakage when a new Home Manager release
    # introduces backwards incompatible changes.
    #
    # You should not change this value, even if you update Home Manager. If you do
    # want to update the value, then make sure to first check the Home Manager
    # release notes.
    home.stateVersion = "25.11"; # Please read the comment before changing.

    # targets.genericLinux.enable = true;
    #
    # targets.genericLinux.nixGL.packages = {
    #   intel = pkgs.nixgl.nixGLIntel;
    # };

    myModules.waybar = {
      compositor = "mango";
    };

    xdg = {
      enable = true;
      mime.enable = true;
    };

    targets.genericLinux.enable = true;

    targets.genericLinux.nixGL = {
      packages = nixgl.packages;

      defaultWrapper = "mesa";

      installScripts = ["mesa"];
    };

    nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];

    # programs.joplin-desktop = {
    #   enable = true;
    #   package = (config.lib.nixGL.wrap pkgs.joplin-desktop);
    # };

    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
      # # Building this configuration will create a copy of 'dotfiles/screenrc' in
      # # the Nix store. Activating the configuration will then make '~/.screenrc' a
      # # symlink to the Nix store copy.
      # ".screenrc".source = dotfiles/screenrc;

      # # You can also set the file content immediately.
      # ".gradle/gradle.properties".text = ''
      #   org.gradle.console=verbose
      #   org.gradle.daemon.idletimeout=3600000
      # '';
    };

    # Home Manager can also manage your environment variables through
    # 'home.sessionVariables'. These will be explicitly sourced when using a
    # shell provided by Home Manager. If you don't want to manage your shell
    # through Home Manager then you have to manually source 'hm-session-vars.sh'
    # located at either
    #
    #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
    #
    # or
    #
    #  /etc/profiles/per-user/docair/etc/profile.d/hm-session-vars.sh
    #
    home.sessionVariables = {
      EDITOR = "nvim";
    };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
