{ self, inputs, ... }: {

  flake.modules.nixos.SarastiConfiguration = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.modules.nixos.default
      self.modules.nixos.hardware
    ];
  };
}
