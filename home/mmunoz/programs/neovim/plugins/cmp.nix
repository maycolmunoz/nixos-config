{ ... }:
{
  plugins.cmp = {
    enable = true;
    settings = {
      mapping = {
        "<C-Space>" = {
          __raw = "require('cmp').mapping.complete()";
        };
        "<C-b>" = {
          __raw = "require('cmp').mapping.scroll_docs(-4)";
        };
        "<C-f>" = {
          __raw = "require('cmp').mapping.scroll_docs(4)";
        };
        "<C-e>" = {
          __raw = "require('cmp').mapping.abort()";
        };
        "<CR>" = {
          __raw = "require('cmp').mapping.confirm({ select = true })";
        };
      };
      sources = [
        { name = "nvim_lsp"; }
        { name = "snippets"; }
        { name = "path"; }
        { name = "buffer"; }
      ];
    };
  };

  plugins.cmp-nvim-lsp.enable = true;

  plugins.nvim-snippets = {
    enable = true;
    settings = {
      friendly_snippets = true;
      create_cmp_source = true;
    };
  };

  plugins.friendly-snippets.enable = true;
}
