{ inputs, hostConfig, ... }: {
  home.username = hostConfig.username;
  home.homeDirectory = "/home/${hostConfig.username}";
  home.stateVersion = hostConfig.stateVersion;

  programs.home-manager.enable = true;

  imports = [
    (./desktop + "/${hostConfig.desktop}.nix")
    ./desktop/fonts.nix
    ./programs/zsh.nix
    ./programs/fastfetch
    ./programs/cli.nix
    ./programs/dev.nix
    ./programs/git.nix
    ./programs/ssh.nix
    ./programs/ghostty.nix
    ./programs/opencode
    ./programs/vscodium.nix
    ./programs/apps.nix
  ];
}
