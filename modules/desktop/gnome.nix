{ config, pkgs, ... }:

{
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = with pkgs; [
    gnome-software
    gnome-tour
    gnome-weather
    gnome-clocks
    gnome-calendar
    gnome-contacts
    gnome-maps
    epiphany
    yelp
  ];

  environment.systemPackages = with pkgs; [
    gnome-boxes
    gnome-tweaks

    gnomeExtensions.user-themes
    gnomeExtensions.blur-my-shell
    gnomeExtensions.clipboard-indicator

    bibata-cursors
    papirus-icon-theme
  ];
}
