{
  inputs,
  hostConfig,
  ...
}:
{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    sharedModules = [ inputs.nixvim.homeModules.nixvim ];
    extraSpecialArgs = {
      inherit inputs;
      inherit hostConfig;
    };
    backupFileExtension = "hm-backup";
    users.${hostConfig.username} = import ./home/${hostConfig.username};
  };
}
