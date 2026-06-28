{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tree
    bat
    wget
    fastfetch
    corefonts
    btop
    yazi
    lazygit
  ];
}
