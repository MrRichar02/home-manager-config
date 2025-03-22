{
  programs.nushell = {
    enable = true;
    shellAliases = {
      snrsf = "sudo nixos-rebuild switch --flake ~/config-flake";
      snrtf = "sudo nixos-rebuild test --flake ~/config-flake";
      nvf = "~/config-flake/editors/nvf/result/bin/nvim";
      nixv = "~/config-flake/editors/nixvim/result/bin/nvim";
    };
    extraConfig = '' 
      $env.config.show_banner = false
    '';
  };
}
