{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      hostConfig = import ./config.nix;
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.${hostConfig.hostname} = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          inherit hostConfig;
        };
        modules = [
          ./hosts/nixos/default.nix
          home-manager.nixosModules.home-manager
          ./home-manager.nix
        ];
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.${system}.nixfmt-tree;
    };
}
