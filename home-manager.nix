{inputs, ...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {inherit inputs;};
    backupFileExtension = "hm-backup";
    users.mmunoz = import ./home/mmunoz;
  };
}
