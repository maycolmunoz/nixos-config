{ inputs, hostConfig, ... }: {
  home.username = hostConfig.username;
  home.homeDirectory = "/home/${hostConfig.username}";
  home.stateVersion = hostConfig.stateVersion;

  programs.home-manager.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "brave-browser.desktop";
      "x-scheme-handler/http" = "brave-browser.desktop";
      "x-scheme-handler/https" = "brave-browser.desktop";
      "x-scheme-handler/about" = "brave-browser.desktop";
      "x-scheme-handler/unknown" = "brave-browser.desktop";
      "application/pdf" = "onlyoffice-desktopeditors.desktop";
    };
    associations.added."application/pdf" = "onlyoffice-desktopeditors.desktop";
  };

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
