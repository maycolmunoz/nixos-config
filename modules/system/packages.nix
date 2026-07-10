{
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = with pkgs;
    [
      tree
      wget
      fastfetch
      corefonts
      lazygit
      obsidian
      obs-studio
      onlyoffice-desktopeditors
    ]
    ++ (with pkgs-unstable; [
      vscode
      opencode
      brave
    ]);
}
