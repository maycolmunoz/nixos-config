{ ... }: {
  imports = [
    ./packages.nix
    ./xserver.nix
  ];

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.dconf.enable = true;
}
