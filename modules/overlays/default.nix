{inputs, ...}:
{
  nixpkgs.overlays = [
    inputs.kickstart-nix.overlays.default
  ];
}

