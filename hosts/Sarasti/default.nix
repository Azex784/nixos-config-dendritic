{ self, inputs, ... }: {
  flake.nixosConfigurations.Sarasti = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.modules.nixos.SarastiConfiguration

      inputs.lanzaboote.nixosModules.lanzaboote
        ({ pkgs, lib, ... }: {

          environment.systemPackages = [
            # For debugging and troubleshooting Secure Boot.
            pkgs.sbctl
          ];

          # Lanzaboote currently replaces the systemd-boot module.
          # This setting is usually set to true in configuration.nix
          # generated at installation time. So we force it to false
          # for now.
          boot.loader.systemd-boot.enable = lib.mkForce false;

          boot.lanzaboote = {
            enable = true;
            pkiBundle = "/var/lib/sbctl";
          };
        })

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
