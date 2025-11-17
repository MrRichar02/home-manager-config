{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.kickstart-nix.overlays.default

    (final: prev: {
      waypaper = prev.waypaper.overrideAttrs(old: rec {
        version = "2.7";
        src = old.src.override {
          tag = version;
          hash = "sha256-wtYF9H56IARkrFbChtuhWtOietA88khQJSOpfDtGQro=";
        };
      });
    })
  ];
}
