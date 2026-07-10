{ ... }:

{
  imports = [
    ./desktop/default.nix
    ./services/pipewire.nix
    ./services/printing.nix
    ./services/flatpak.nix
    ./services/fwupd.nix
    ./services/virtualisation.nix
    ./programs/zsh.nix
    ./programs/firefox.nix
    ./system/boot.nix
    ./system/locale.nix
    ./system/users.nix
    ./system/nix-settings.nix
    ./system/packages.nix
  ];
}
