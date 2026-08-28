{ self, inputs, ... }: {

  flake.modules.nixos.OmnisonConfiguration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.modules.nixos.default
      self.modules.nixos.OmnisonHardware
    ];

    networking.hostName = "Omnison"; # Define your hostname.

  };
}
