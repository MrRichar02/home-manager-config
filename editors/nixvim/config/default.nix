{
  # Import all your configuration modules here
  imports = [
    ./treesitter.nix
    ./telescope.nix
    ./lsp.nix
    ./cmp.nix
    ./colorScheme.nix
    ./lua-line.nix
    ./web-devicons.nix
  ];

  clipboard = {

    providers.wl-copy.enable = true;

  };

  extraConfigLua = ''
    vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
  '';


  globals = {
    mapleader = " ";
  };

  opts = {
    number = true;
    relativenumber = true;

    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    expandtab = true;

    swapfile = false;

    mouse = "a";

    scrolloff = 8;

    autoindent = true;
  };

  keymaps = [
    {
      action = "<cmd>Ex<CR>";
      key = "<C-n>";
    }
  ];

}
