{ pkgs, hostConfig, ... }: {
  home.packages = with pkgs; [
    tree
    wget
    television
    nixfmt
    distrobox
    mcp-nixos
    officecli
    codegraph
    fd
    ripgrep
  ];

  programs.nh = {
    enable = true;
    flake = hostConfig.flakePath;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.gh.enable = true;

  programs.bat = {
    enable = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      vim_keys = true;
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
  };

  editorconfig = {
    enable = true;
    settings = {
      "*" = {
        charset = "utf-8";
        end_of_line = "lf";
        insert_final_newline = true;
        trim_trailing_whitespace = true;
        indent_style = "space";
        indent_size = 2;
      };
      "*.md" = {
        trim_trailing_whitespace = false;
      };
      "Makefile" = {
        indent_style = "tab";
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
