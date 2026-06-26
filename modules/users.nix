{ pkgs, ... }:

{
  users.users."mmunoz" = {
    isNormalUser = true;
    description = "Maycol Muñoz";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
}
