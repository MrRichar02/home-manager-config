{
  self,
  inputs,
  ...
}: {
  flake.homeModules.swww = {
    services.swww = {
      enable = true;
    };
  };
}
