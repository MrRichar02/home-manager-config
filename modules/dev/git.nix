{self, inputs, ...}:{
	flake.homeModules.git = {
    programs.git = {
      enable = true;
      settings = {
        user.email = "richarmamadi03@gmail.com";
        user.name = "MrRichar02";
        init.defaultBranch = "main";
      };
    };
	};
}
