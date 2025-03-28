{ self, ...}:
{
  plugins.lsp = {
    enable = true;

    servers = {
      pyright = {
        enable = true;
        settings = {
          python.analysis.typeCheckingMode = "off";
        };
      };
      ruff.enable = true;
      #nil_ls.enable = true;
      ts_ls.enable = true;
      gopls.enable = true;
      sqls.enable = true;
    };
    keymaps.lspBuf = {

      "<leader>K" = "hover";
      "<leader>gD" = "references";
      "<leader>gd" = "definition";
      "<leader>gi" = "implementation";
      "<leader>gt" = "type_definition";

    };
  };
}
