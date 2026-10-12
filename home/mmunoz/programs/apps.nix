{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # Browsers
    firefox
    brave

    # Notes
    obsidian

    # Office suite
    onlyoffice-desktopeditors

    # Media and speech
    obs-studio
    handy

    # Virtualization
    gnome-boxes
  ];
}
