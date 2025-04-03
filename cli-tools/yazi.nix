{
  programs.yazi = {
    enable = true;
    keymap = {
      manager.prepend_keymap = [
        { run = "cd ~/Documents/sexto-semestre/"; on = ["g s"]; }
      ];
    };
  };
}
