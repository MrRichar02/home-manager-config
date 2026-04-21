{
  inputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./java-applications.nix
		./wlr-which-key-menus.nix
  ];
  nixpkgs.overlays = [
    inputs.kickstart-nix.overlays.default

    # (final: prev: {
    #   waypaper = prev.waypaper.overrideAttrs (old: rec {
    #     version = "2.7";
    #     src = old.src.override {
    #       tag = version;
    #       hash = "sha256-wtYF9H56IARkrFbChtuhWtOietA88khQJSOpfDtGQro=";
    #     };
    #   });
    # })

    (final: prev: {
      clipse = prev.clipse.overrideAttrs (old: rec {
        version = "1.2.1";
        src = old.src.override {
          rev = "v${version}";
          hash = "sha256-iDMHEhYuxspBYG54WivnVj2GfMxAc5dcrjNxtAMhsck=";
        };
        vendorHash = "sha256-rq+2UhT/kAcYMdla+Z/11ofNv2n4FLvpVgHZDe0HqX4=";
        tags = ["wayland"];
      });
    })
  ];
}
