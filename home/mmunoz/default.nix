{ config, pkgs, ... }:

{
  home.username = "mmunoz";
  home.homeDirectory = "/home/mmunoz";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ../../modules/desktop/gnome/home.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [ ];

  programs.git = {
    enable = true;
    settings.user.name = "maycolmunoz";
    settings.user.email = "estivenyeizon@gmail.com";
    settings.init.defaultBranch = "main";
  };
}
