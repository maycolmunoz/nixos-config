{ pkgs, ... }: {
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    bat
    btop
    yazi
  ];
}
