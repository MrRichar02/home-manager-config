{
  description = "Home Manager configuration of docair";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim-flake.url = "path:/home/docair/config-flake/hosts/editors/nixvim";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nvf-flake.url = "path:/home/docair/config-flake/hosts/editors/nvf";
  };

  outputs = { nixpkgs, home-manager, ... }@ inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."docair" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [ ./home.nix ];


        # Optionally use extraSpecialArgs

        extraSpecialArgs = { inherit inputs; };

        # to pass through arguments to home.nix
      };
    };
}
