{
  self,
  inputs,
  ...
}: {
  flake.homeModules.taskwarrior = {pkgs, ...}: {
    programs.taskwarrior = {
      enable = true;
      package = pkgs.taskwarrior3;
      dataLocation = "$HOME/tasks";
    };
  };
}
