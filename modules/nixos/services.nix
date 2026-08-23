{ self, inputs, ... }: {

  flake.modules.nixos.services = { pkgs, lib, ... }: {
    # Services
    services = {
      # Enable the X11 windowing system.
      xserver.enable = true;
      # Enable the OpenSSH daemon.
      openssh.enable = true;
      # Configure keymap in X11
      xserver.xkb = {
          layout = "pl";
          variant = "";
          options = "";
      };
      # Enable CUPS to print documents.
      printing.enable = true;
      # Enable sound
      pipewire = {
        enable = true;
        pulse.enable = true;
      };
    };
  };
}
