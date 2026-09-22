{ self, inputs, ... }: {

  flake.modules.nixos.pipewire = { pkgs, lib, ... }: {
    services = {
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
