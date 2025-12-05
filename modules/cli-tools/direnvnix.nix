{
  lib,
  config,
  ...
}: {
  options.myModules.direnvnix.enable = lib.mkEnableOption "Enables direnvnix";

  config = lib.mkIf config.myModules.direnvnix.enable {
    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
