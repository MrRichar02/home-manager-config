{lib, config, ...}:
{
  options.myModules.starship.enable = lib.mkEnableOption "enables starship module";

  config = lib.mkIf config.myModules.starship.enable {

    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      settings = {

        "$schema" = "https://starship.rs/config-schema.json";

        add_newline = false;

        character = {
          # Note the use of Catppuccin color 'peach'
          success_symbol = "[[󰄛](green) ❯](peach)";
          error_symbol = "[[󰄛](red) ❯](peach)";
        };
      };
    };
  };
}
