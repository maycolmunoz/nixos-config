{ inputs, hostConfig, ... }: {
  home.username = hostConfig.username;
  home.homeDirectory = "/home/${hostConfig.username}";
  home.stateVersion = hostConfig.stateVersion;

  programs.home-manager.enable = true;

  imports = [
    (./desktop + "/${hostConfig.desktop}.nix")
    ./desktop/fonts.nix
    ./programs/zsh
    ./programs/fastfetch
    ./programs/cli.nix
    ./programs/dev.nix
    ./programs/git
    ./programs/ghostty
    ./programs/opencode
    ./programs/antigravity-cli
    ./programs/cline
    ./programs/apps.nix
  ];
}
