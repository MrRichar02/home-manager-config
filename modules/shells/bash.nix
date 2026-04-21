{
  self,
  inputs,
  ...
}: {
  flake.homeModules.bash = {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "ls --color=auto";
      };
    };
  };
}
