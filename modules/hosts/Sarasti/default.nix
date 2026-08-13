{ self, inputs, ... }: {
  flake.nixosConfigurations.Sarasti = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.SarastiConfiguration

      inputs.home-manager.nixosModules.home-manager{
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = { inherit inputs; };
          users.azex = self.modules.homeManager.azex;
        };
      }
    ];
  };
}
