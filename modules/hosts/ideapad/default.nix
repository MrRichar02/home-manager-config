{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations.ideapad = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = import inputs.nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
    extraSpecialArgs = {nixgl = inputs.nixgl;};
    modules = [
      self.homeModules.ideapad-home
			inputs.stylix.homeModules.stylix
    ];
  };
}
