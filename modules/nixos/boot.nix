{ self, inputs, ... }: {

  flake.modules.nixos.boot = { pkgs, lib, ... }: {
    boot = {
      # The newest kernel version
      kernelPackages = pkgs.linuxPackages_latest;
      plymouth = {
          enable = true;
          theme = "bgrt";
      };

      consoleLogLevel = 3;
      initrd.verbose = false;
      kernelParams = [
        "splash"
        "quiet"
        "rd.udev.log_level=3"
        "rd.systemd.show_status=auto"
      ];

      loader = {
        timeout = 1;
        # Use the systemd-boot EFI boot loader.
        systemd-boot = {
          enable = true;
        };

        efi.canTouchEfiVariables = true;
      };
    };
  };
}
