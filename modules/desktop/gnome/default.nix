{pkgs, ...}: {
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "latam";
      variant = "";
    };
  };

  programs.dconf.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

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
    gnomeExtensions.caffeine

    bibata-cursors
    papirus-icon-theme
  ];
}
