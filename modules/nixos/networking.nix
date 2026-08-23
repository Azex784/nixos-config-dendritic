{ self, inputs, ... }: {

  flake.modules.nixos.networking = { pkgs, lib, ... }: {
    networking = {
      # Configure network connections interactively with nmcli or nmtui.networking.
      networkmanager = {
        enable = true;
      };
    };
  };
}
