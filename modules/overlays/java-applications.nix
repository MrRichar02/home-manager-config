{
  pkgs,
  lib,
  ...
}: {
  nixpkgs.overlays = [
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
