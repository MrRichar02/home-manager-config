{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    inputs.kickstart-nix.overlays.default

    (final: prev: {
      waypaper = prev.waypaper.overrideAttrs {
        version = "2.7";
        src = prev.fetchFromGitHub {
          owner = "anufrievroman";
          repo = "waypaper";
          tag = "2.7";
          hash = "sha256-wtYF9H56IARkrFbChtuhWtOietA88khQJSOpfDtGQro=";
        };
      };
    })
  ];
}
