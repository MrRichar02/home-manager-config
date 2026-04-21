{
  lib,
  config,
  ...
}: {
  options.myModules.nushell.enable = lib.mkEnableOption "enables nushell module";

  config = lib.mkIf config.myModules.nushell.enable {
    programs.nushell = {
      enable = true;
      extraConfig = ''
        $env.config.show_banner = false
      '';
    };
  };
}
