{ self, inputs, ... }: {
  flake.modules.nixos.ly = { pkgs, lib, ... }: {
    services.displayManager.ly = {
      enable = true;

    };
  };
}
