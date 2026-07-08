{ pkgs, inputs, ... }:

let
  unstable = import inputs.nixpkgs-unstable {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
in

{
  environment.systemPackages = with pkgs; [
    tree
    bat
    wget
    fastfetch
    corefonts
    btop
    yazi
    lazygit
    obsidian
    obs-studio
    onlyoffice-desktopeditors
  ] ++ (with unstable; [
    vscode
    opencode
    brave
  ]);
}
