{lib, config, ...}:
{
    options.myModules.onlyOffice.enable = lib.mkEnableOption "enables only office module";

    config = lib.mkIf config.myModules.onlyOffice.enable {
        programs.onlyoffice = {
            enable = true;
            settings = {
                editorWindowMode = false;
                maximized = true;
            };
        };
    };
}

