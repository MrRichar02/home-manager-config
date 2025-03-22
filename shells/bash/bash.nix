{
  programs.bash = {
    enable = true;
    shellAliases = {
      snrsf = "sudo nixos-rebuild switch --flake ~/config-flake";
      snrtf = "sudo nixos-rebuild test --flake ~/config-flake";
      nvf = "~/config-flake/editors/nvf/result/bin/nvim";
      nixv = "~/config-flake/editors/nixvim/result/bin/nvim";
    };
    profileExtra = '' 
      if [[ -z $DISPLAY ]] && [[ $(tty) == /dev/tty1 ]]; then
        exec Hyprland
      fi

      '';
  };

}
