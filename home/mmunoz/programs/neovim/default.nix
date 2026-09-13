{ pkgs, ... }:
{
  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    nixpkgs.source = pkgs.path;

    imports = [
      ./plugins/base.nix
      ./plugins/editor.nix
      ./plugins/search.nix
      ./plugins/cmp.nix
      ./plugins/lsp.nix
      ./plugins/git.nix
      ./plugins/misc.nix
    ];

    extraPackages = with pkgs; [
      ripgrep
      fd
      prettier
      nixfmt
      blade-formatter
      tailwindcss-language-server
    ];

    globals.mapleader = " ";

    opts = {
      number = true;
      relativenumber = true;
      termguicolors = true;
      signcolumn = "yes";

      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;

      ignorecase = true;
      smartcase = true;

      undofile = true;
      clipboard = "unnamedplus";
      mouse = "a";
      scrolloff = 8;
      updatetime = 250;
      completeopt = "menu,menuone,noselect";
    };

    keymaps = [
      {
        mode = "i";
        key = "jk";
        action = "<Esc>";
        options.desc = "Exit insert mode";
      }

      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>Neotree toggle<cr>";
        options.desc = "Explorer";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>bprevious<bar>bdelete<cr>";
        options.desc = "Close buffer";
      }
      {
        mode = "n";
        key = "<leader>bf";
        action = "<cmd>lua require('bufferline').cycle(1)<cr>";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<leader>bp";
        action = "<cmd>lua require('bufferline').cycle(-1)<cr>";
        options.desc = "Prev buffer";
      }

      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Window left";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Window down";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Window up";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Window right";
      }

      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Live grep";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<cr>";
        options.desc = "Buffers";
      }
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<cr>";
        options.desc = "Help";
      }
      {
        mode = "n";
        key = "<leader>fd";
        action = "<cmd>Telescope diagnostics<cr>";
        options.desc = "Diagnostics";
      }
      {
        mode = "n";
        key = "<leader>fs";
        action = "<cmd>Telescope lsp_document_symbols<cr>";
        options.desc = "Symbols";
      }
      {
        mode = "n";
        key = "<leader>fw";
        action = "<cmd>Telescope grep_string<cr>";
        options.desc = "Grep word";
      }
      {
        mode = "n";
        key = "<leader>fr";
        action = "<cmd>Telescope resume<cr>";
        options.desc = "Resume";
      }

      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostics toggle<cr>";
        options.desc = "Problems";
      }
      {
        mode = "n";
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
        options.desc = "LazyGit";
      }

      {
        mode = "n";
        key = "<leader>F";
        action = "<cmd>lua require('conform').format({ lsp_fallback = true })<cr>";
        options.desc = "Format";
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = "<cmd>Gitsigns toggle_current_line_blame<cr>";
        options.desc = "Git blame";
      }
      {
        mode = "n";
        key = "<leader>z";
        action = "<cmd>Yazi<cr>";
        options.desc = "Yazi";
      }
      {
        mode = "n";
        key = "<leader>o";
        action = "<cmd>OpenCode<cr>";
        options.desc = "OpenCode";
      }
    ];

    userCommands.OpenCode = {
      command = "lua require('opencode').ask()";
      desc = "OpenCode prompt";
    };

    autoCmd = [
      {
        event = "TextYankPost";
        desc = "Highlight yanked text";
        callback.__raw = "function() vim.highlight.on_yank() end";
      }
    ];

    colorschemes.ayu = {
      enable = true;
      settings.mirage = true;
    };
  };
}
