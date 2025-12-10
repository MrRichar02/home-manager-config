{
  description = "Home Manager configuration of docair";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # nixvim-flake.url = "github:MrRichar02/nixvim";
    # nvf-flake.url = "github:MrRichar02/nvf";
    kickstart-nix.url = "github:MrRichar02/kickstart-nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    stylix.url = "github:danth/stylix/release-25.11";
    mango = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations = {
      "thinkpad" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./hosts/thinkpad-x1
          ./modules
          inputs.stylix.homeModules.stylix
        ];

        # Optionally use extraSpecialArgs

        extraSpecialArgs = {inherit inputs;};

        # to pass through arguments to home.nix
      };

      "ideapad" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./hosts/ideapad
          ./modules
          inputs.stylix.homeModules.stylix
        ];

        # Optionally use extraSpecialArgs

        extraSpecialArgs = {inherit inputs;};

        # to pass through arguments to home.nix
      };

      "void" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./hosts/void
          ./modules
          inputs.stylix.homeModules.stylix
        ];

        # Optionally use extraSpecialArgs

        extraSpecialArgs = {inherit inputs;};

        # to pass through arguments to home.nix
      };
    };
  };
}
