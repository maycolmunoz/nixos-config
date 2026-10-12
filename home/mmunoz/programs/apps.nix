{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    firefox
    obsidian
    obs-studio
    onlyoffice-desktopeditors
    brave
    handy
    gnome-boxes
  ];
}
