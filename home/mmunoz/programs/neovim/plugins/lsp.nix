{ pkgs, ... }:
let
  # ponytail: local pkgs import with allowUnfree; HM pkgs (useGlobalPkgs) ignores nixpkgs.config here
  allowedPkgs = import pkgs.path {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  plugins.lsp = {
    enable = true;

    keymaps.lspBuf = {
      "gd" = "definition";
      "gD" = "declaration";
      "gr" = "references";
      "gi" = "implementation";
      "K" = "hover";
      "<leader>ca" = "code_action";
      "<leader>rn" = "rename";
    };

    keymaps.diagnostic = {
      "[d" = "goto_prev";
      "]d" = "goto_next";
      "<leader>ld" = "open_float";
    };

    servers = {
      lua_ls.enable = true;
      nil_ls.enable = true;

      intelephense = {
        enable = true;
        package = allowedPkgs.intelephense;
        settings.intelephense.environment.phpVersion = "8.4";
      };

      volar.enable = true;
      tailwindcss.enable = true;

      eslint = {
        enable = true;
        package = pkgs.eslint_d;
        filetypes = [
          "javascript"
          "typescript"
          "vue"
        ];
        settings.format = true;
      };
    };
  };

  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = {
        lsp_format = "fallback";
        timeout_ms = 500;
      };
      formatters_by_ft = {
        javascript = [ "prettier" ];
        typescript = [ "prettier" ];
        vue = [ "prettier" ];
        css = [ "prettier" ];
        html = [ "prettier" ];
        json = [ "prettier" ];
        php = [ "prettier" ];
        nix = [ "nixfmt" ];
        blade = [ "blade-formatter" ];
      };
      formatters = {
        prettier = {
          prepend_args = [
            "--single-quote"
            "--no-semi"
          ];
        };
        "blade-formatter" = {
          command = "blade-formatter";
        };
      };
    };
  };

  plugins.trouble.enable = true;
}
