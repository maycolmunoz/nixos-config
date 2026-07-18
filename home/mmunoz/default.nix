{pkgs, ...}: {
  home.username = "mmunoz";
  home.homeDirectory = "/home/mmunoz";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./gnome.nix
    ./zsh.nix
    ./cli.nix
    ./firefox.nix
    ./ghostty.nix
  ];

  programs.git = {
    enable = true;
    settings.user.name = "maycolmunoz";
    settings.user.email = "estivenyeizon@gmail.com";
    settings.init.defaultBranch = "main";
  };
}
