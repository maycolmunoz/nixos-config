{ ... }: {
  services.xserver = {
    enable = true;
    xkb = {
      layout = "latam";
      variant = "";
    };
  };
}
