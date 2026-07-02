{ ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      theme = "";
      plugins = [
        "git"
        "sudo"
        "docker"
        "npm"
        "node"
        "extract"
        "z"
      ];
    };

    shellAliases = {
      ll = "ls -lah";
      la = "ls -A";
      l = "ls -CF";
      update = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      cleanup = "sudo nix-collect-garbage -d";
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;

      nix_shell = {
        symbol = "❄️ ";
        format = "via [❄️ $state( \\($name\\))]($style) ";
      };

      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
      };

      git_commit = { only_detached = true; };

      git_status = {
        conflicted = "🏳";
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕\${count}";
        up_to_date = "✓";
        stashed = "📦\${count}";
        modified = "✎\${count}";
        staged = "⊕\${count}";
        renamed = "➜\${count}";
        deleted = "✗\${count}";
      };

      cmd_duration = {
        min_time = 2000;
        show_milliseconds = false;
      };

      line_break.disable = false;

      username = { show_always = false; };
      hostname = { ssh_only = true; };

      character = {
        success_symbol = "[❄](bold cyan)";
        error_symbol = "[❄](bold red)";
      };
    };
  };
}
