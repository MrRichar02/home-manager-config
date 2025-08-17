{ pkgs, inputs, ...}:
{

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    #editors
    # inputs.nvf-flake.packages.${system}.default
		nvim-pkg

    #wallpaper
    waypaper

		#password manager
		bitwarden-desktop

    #chat apps
    vesktop
    zapzap

    #note taking
    # obsidian

    #sql things
    # dbeaver-bin

    #lab-2 arqui
    postman

		#music
		youtube-music

  ];
}
