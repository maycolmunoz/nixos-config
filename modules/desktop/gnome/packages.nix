{ pkgs, ... }: {
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
}
