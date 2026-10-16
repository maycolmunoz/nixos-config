{ hostConfig, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    oh-my-zsh.enable = true;
    oh-my-zsh.theme = "robbyrussell";
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    shellAliases = {
      # System: activate, trial run, inspect
      update = "nh os switch";
      test = "nh os test";
      diff = "nh os build";

      # Maintenance: inputs, edit, format, GC, generations
      nix-update = "nix flake update && update";
      nix-edit = "code ${hostConfig.flakePath}";
      fmt = "nix fmt ${hostConfig.flakePath}";
      nix-gc = "nh clean all --keep 5";
      nix-history = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";

      # Package search and install
      search = "nix search nixpkgs";
      nix-unfree = "NIXPKGS_ALLOW_UNFREE=1 nix profile add --impure";

      # Project bootstrap
      sail = "[ -f sail ] && sh sail || sh vendor/bin/sail";
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    initContent = ''
      export PATH="$HOME/.local/bin:$PATH"
      export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib"

      # Arrow key history search
      bindkey '^[[A' history-search-backward
      bindkey '^[[B' history-search-forward
    '';
  };
}
