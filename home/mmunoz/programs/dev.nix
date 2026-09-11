{ config, pkgs, ... }:

{
  programs.npm = {
    enable = true;
    settings = {
      prefix = "${config.home.homeDirectory}/.npm-global";
    };
  };

  home.sessionPath = [
    "$HOME/.npm-global/bin"
  ];

  home.packages = with pkgs; [
    php84Packages.composer

    nodejs_24
    pnpm
    yarn

    lazydocker
    lazygit
    lazysql
  ];
}
