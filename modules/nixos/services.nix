{ self, inputs, ... }: {

  flake.modules.nixos.services = { pkgs, lib, ... }: {
    # Services
    services = {
      tailscale.enable = true;
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
      pipewire = {
        enable = true;
        alsa.enable = true;
        pulse.enable = true;
        extraConfig.pipewire."92-high-quality" = {
          "context.properties" = {
            "default.clock.rate" = 44100;
            "default.clock.allowed-rates" = [ 44100 48000 88200 96000 176400 192000 352800 384000 5644800 ];
          };
          "stream.properties" = {
            "resample.quality" = 15;
          };
        };
      };
    };
  };
}
