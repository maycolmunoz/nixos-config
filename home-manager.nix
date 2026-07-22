{ inputs, pkgs-unstable, ... }: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = { inherit inputs pkgs-unstable; };
    backupFileExtension = "hm-backup";
    users.mmunoz = import ./home/mmunoz;
  };
}
