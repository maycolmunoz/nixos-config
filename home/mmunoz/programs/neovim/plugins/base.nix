{ ... }:
{
  plugins.web-devicons.enable = true;

  plugins.lualine = {
    enable = true;
    settings.options.theme = "ayu_mirage";
  };

  plugins.bufferline = {
    enable = true;
    settings.options = {
      diagnostics = "nvim_lsp";
      show_buffer_close_icons = true;
      show_close_icon = false;
    };
  };

  plugins.neo-tree = {
    enable = true;
    settings = {
      close_if_last_window = true;
      filesystem = {
        follow_current_file.enabled = true;
        use_libuv_file_watcher = true;
        hijack_netrw_behavior = "open_default";
      };
    };
  };

  plugins.which-key.enable = true;
}
