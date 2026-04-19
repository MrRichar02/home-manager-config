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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    stylix.url = "github:danth/stylix/release-25.11";
    mango = {
      url = "github:DreamMaoMao/mangowc";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixGL = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
  };

  outputs = {
    nixpkgs,
    nixpkgs-unstable,
    home-manager,
    flake-parts,
    ...
  } @ inputs: 
    flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);

}
