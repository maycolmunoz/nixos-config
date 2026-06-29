{ config, pkgs, ... }:

{
  home.username = "mmunoz";
  home.homeDirectory = "/home/mmunoz";
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  imports = [
    ./zsh.nix
    ./dconf.nix
  ];

  home.packages = with pkgs; [ ];

  programs.git = {
    enable = true;
    settings.user.name = "itsmmunoz";
    settings.user.email = "estivenyeizon@gmail.com";
  };
}
