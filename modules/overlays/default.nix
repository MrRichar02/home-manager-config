{
  inputs,
  pkgs,
  ...
}: {
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

    (final: prev: {
      mars-mips = prev.mars-mips.overrideAttrs (old: {
        installPhase =
          old.installPhase
          + ''

            # Rehacer el wrapper con las variables
            			 wrapProgram $out/bin/Mars \
            			 --set _JAVA_AWT_WM_NONREPARENTING "1" \
            			 --set _JAVA_OPTIONS "-Dsun.java2d.opengl=false -Dsun.java2d.xrender=false"

          '';
      });
    })

    (final: prev: {
      logisim-evolution = prev.logisim-evolution.overrideAttrs (old: {
        installPhase =
          old.installPhase
          + ''

            # Rehacer el wrapper con las variables
            			 wrapProgram $out/bin/logisim-evolution \
            			 --set _JAVA_AWT_WM_NONREPARENTING "1" \
            			 --set _JAVA_OPTIONS "-Dsun.java2d.opengl=false -Dsun.java2d.xrender=false"

          '';
      });
    })
  ];
}
