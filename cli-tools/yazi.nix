{
  programs.yazi = {
    enable = true;
    keymap = {
      manager.append_keymap = [
        { run = "cd ~/Documents/sexto-semestre/"; on = ["g" "s"]; }
      ];
    };
  };
}
