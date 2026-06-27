{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    enableCompletion = true;

    ohMyZsh = {
      enable = true;

      theme = "agnoster";

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

    histSize = 10000;
    histFile = "$HOME/.zsh_history";

    setOptions = [
      "HIST_IGNORE_DUPS"
      "HIST_FIND_NO_DUPS"
      "SHARE_HISTORY"
    ];
  };

}
