{ hostConfig, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
        "sudo"
        "docker"
        "extract"
        "z"
        "copypath"
        "copyfile"
        "web-search"
      ];
    };

    shellAliases = {
      update = "nh os switch";
      test = "nh os test";
      diff = "nh os build";
      nix-gc = "nh clean all --keep 5";
      nix-history = "sudo nix-env --list-generations --profile /nix/var/nix/profiles/system";
      nix-edit = "codium ${hostConfig.flakePath}";
      nix-update = "nix flake update && update";
      sail = "[ -f sail ] && sh sail || sh vendor/bin/sail";
      search = "nix search nixpkgs";
      nix-unfree = "NIXPKGS_ALLOW_UNFREE=1 nix profile add --impure";
      fmt = "nix fmt ${hostConfig.flakePath}";
    };

    history = {
      size = 10000;
      path = "$HOME/.zsh_history";
      ignoreDups = true;
      share = true;
    };

    initContent = ''
      # Arrow key history search (after oh-my-zsh init)
      bindkey '^[[A' history-search-backward
      bindkey '^[[B' history-search-forward
    '';
  };
}
