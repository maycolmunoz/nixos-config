{ ... }: {
  programs.git = {
    enable = true;
    settings.user.name = "maycolmunoz";
    settings.user.email = "estivenyeizon@gmail.com";
    settings.init.defaultBranch = "main";
  };
}
