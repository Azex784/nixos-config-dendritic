{ self, inputs, ... }: {
  flake.modules.nixos.nvidia-drivers = { pkgs, lib, ... }: {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      # Nvidia
      graphics.enable = true;
      nvidia = {
          modesetting.enable = true;
          open = true;
          nvidiaSettings = true;
      };
    };
  };
}
