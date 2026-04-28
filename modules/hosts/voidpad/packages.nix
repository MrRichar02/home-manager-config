{self, inputs, ...}:{
  flake.homeModules.voidpad-pkgs = {pkgs, nixgl, config, ...}:{
    # The home.packages option allows you to install Nix packages into your
    # environment.
    home.packages = let
    screenshotmango = pkgs.writeShellScriptBin "screenshotmango" ''
      ${pkgs.grim}/bin/grim -l 0 -g "$(${pkgs.slurp}/bin/slurp)" - | ${pkgs.wl-clipboard}/bin/wl-copy
    '';
  in with pkgs; [
      # (config.lib.nixGL.wrap pkgs.vscode)
      vscode

      (config.lib.nixGL.wrap zapzap)
      vesktop
      teams-for-linux

      firefoxpwa

      alejandra
      nixd

      joplin-desktop

      tmux
      bitwarden-desktop
      
      waypaper

      layouts-mango-menu

      screenshotmango

      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      # pkgs.hello

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];
    };
}
