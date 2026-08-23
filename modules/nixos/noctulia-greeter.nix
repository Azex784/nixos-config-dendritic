{ self, inputs, ... }: {

  flake.modules.nixos.noctalia-greeter = { pkgs, lib, ... }: {
    imports = [
      inputs.noctalia-greeter.nixosModules.default
    ];
    programs.noctalia-greeter = {
      enable = true;
      # Full declarative greeter.toml (overwritten each activation). See examples/greeter.toml.
      settings = {
        cursor = {
          theme = "Nordzy-cursors";
          size = 24;
          path = "${pkgs.nordzy-cursor-theme}/share/icons";
        };
      };
    };
  };
}
