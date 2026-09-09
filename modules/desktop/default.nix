{ hostConfig, ... }: {
  imports = [
    (./. + "/${hostConfig.desktop}/default.nix")
  ];
}
