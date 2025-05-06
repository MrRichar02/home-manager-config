{ pkgs, inputs, lib, config, ...}:
{
    options.myModules.stylix.enable = lib.mkEnableOption "enables stylix module";

    config = lib.mkIf config.myModules.stylix.enable {
        stylix = {
            enable = true;
            # base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
            base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";

            targets = {
                rofi.enable = false;
            };

            cursor = {
                package = pkgs.bibata-cursors;
                name = "Bibata-Modern-Ice";
                size = 24;
            };

            fonts = {
                monospace = {
                    package = pkgs.nerd-fonts.jetbrains-mono;
                    name = "JetBrainsMono Nerd Font Mono";
                };

                sansSerif = {
                    package = pkgs.dejavu_fonts;
                    name = "DejaVu Sans";
                };

                serif = {
                    package = pkgs.dejavu_fonts;
                    name = "DejaVu Serif";
                };

                sizes = {
                    applications = 12;
                    terminal = 15;
                    desktop = 12;
                    popups = 12;
                };
            };

            opacity = {
                applications = 1.0;
                terminal = 1.0;
                desktop = 1.0;
                popups = 1.0;
            };

            polarity = "dark";

        };

    };
}
