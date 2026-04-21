{
  lib,
  config,
  ...
}: {
  options.myModules.onlyOffice.enable = lib.mkEnableOption "enables only office module";

  config = lib.mkIf config.myModules.onlyOffice.enable {
    programs.onlyoffice = {
      enable = true;
      settings = {
        UITheme = "theme-contrast-dark";
        editorWindowMode = false;
        forcedRtl = false;
        maximized = true;
        titlebar = "custom";
      };
    };
  };
}
