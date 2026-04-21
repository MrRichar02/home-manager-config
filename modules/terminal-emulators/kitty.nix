{
  self,
  inputs,
  ...
}: {
  flake.homeModules.kitty = {pkgs, ...}: {
    programs.kitty = {
      enable = true;
      font = {
        name = "Monocraft Nerd Font";
        package = pkgs.monocraft;
        size = 15;
      };
      themeFile = "Catppuccin-Mocha";
    };
  };
}
