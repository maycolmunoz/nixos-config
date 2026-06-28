{ ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 14d";
  };

  nix.optimise.automatic = true;

  boot.tmp.cleanOnBoot = true;

  zramSwap.enable = true;

  nixpkgs.config.allowUnfree = true;
}
