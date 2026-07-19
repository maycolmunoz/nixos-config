{ ... }: {
  imports = [
    ./hardware.nix
    ../../modules/default.nix
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  system.stateVersion = "26.05";
}
