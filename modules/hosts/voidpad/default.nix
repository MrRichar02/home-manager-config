{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations.voidpad = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    extraSpecialArgs = let
      pkgsu = import inputs.nixpkgs-unstable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in {
      nixgl = inputs.nixgl;
      inherit pkgsu;
    };
    modules = [
      self.homeModules.voidpad-home
    ];
  };
}
