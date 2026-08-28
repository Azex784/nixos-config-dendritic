{ self, inputs, ... }: {
  flake.nixosConfigurations.Omnison = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.OmnisonConfiguration
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
