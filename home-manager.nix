{...}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.mmunoz = import ./home/mmunoz;
  };
}
