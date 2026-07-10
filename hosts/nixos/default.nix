{ ... }:

{
  imports = [
    ./hardware.nix
    ../../modules/default.nix
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.xserver = {
    enable = true;
    xkb = {
      layout = "latam";
      variant = "";
    };
  };

  system.stateVersion = "26.05";
}
