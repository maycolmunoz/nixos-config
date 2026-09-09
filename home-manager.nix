{
  inputs,
  hostConfig,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit hostConfig;
    };
    backupFileExtension = "hm-backup";
    users.${hostConfig.username} = import ./home/mmunoz;
  };
}
