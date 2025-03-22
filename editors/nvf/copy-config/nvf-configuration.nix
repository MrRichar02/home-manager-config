{ pkgs, lib, ... }:
{
  vim = {

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
    };

    dashboard.alpha.enable = true;

    luaConfigPost = ''
      vim.cmd("set nobackup")
      vim.cmd("set noswapfile")
      vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]
      vim.cmd("set scrolloff=8")
    '';

    statusline.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;

    options = {
      tabstop = 2;
      shiftwidth = 2;
    };

    languages = {
      enableLSP = true;
      enableTreesitter = true;

      nix.enable = true;
      ts.enable = true;
      python.enable = true;
      go.enable = true;

    };

    keymaps = [
      {
        key = "<C-n>";
        mode = "n";
        silent = true;
        action = "<cmd>:Ex<CR>";
      }
      {
        key = "<leader><leader>";
        mode = "n";
        silent = true;
        action = ":Telescope oldfiles<CR>";
      }
    ];

    lazy.plugins = {
      "harpoon" = {
        package = pkgs.vimPlugins.harpoon;
        setupModule = "harpoon";
        # Cargar al presionar una tecla
        keys = [
          {
            key = "<leader>m";
            mode = "n";
            action = ":lua require('harpoon.ui').toggle_quick_menu()<CR>";
          }
          {
            key = "<leader>a";
            mode = "n";
            action = ":lua require('harpoon.mark').add_file()<CR>";
          }
          {
            key = "<leader>n";
            mode = "n";
            action = ":lua require('harpoon.ui').nav_next()<CR>";
          }
          {
            key = "<leader>p";
            mode = "n";
            action = ":lua require('harpoon.ui').nav_prev()<CR>";
          }
        ];
      };
    };

  };

}
