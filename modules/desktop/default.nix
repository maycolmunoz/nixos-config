{ hostConfig, ... }: {
  imports = [
    (./. + "/${hostConfig.desktop}/default.nix")
  ];

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
