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
    extraSpecialArgs = {nixgl = inputs.nixgl;};
    modules = [
      self.homeModules.voidpad-home
    ];
  };
}
