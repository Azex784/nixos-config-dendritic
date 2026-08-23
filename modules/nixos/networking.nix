{ self, inputs, ... }: {

  flake.modules.nixos.services = { pkgs, lib, ... }: {
    networking = {
      # Configure network connections interactively with nmcli or nmtui.networking.
      networkmanager = {
        enable = true;
      };
    };

  };
}
