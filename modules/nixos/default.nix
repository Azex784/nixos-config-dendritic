{ self, inputs, ... }: {

  flake.modules.nixos.default = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.modules.nixos.bluetooth
      self.modules.nixos.nvidia-drivers
      self.modules.nixos.boot
      self.modules.nixos.niri
      self.modules.nixos.packages
      self.modules.nixos.users
      self.modules.nixos.ly
    ];

    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    networking = {
      hostName = "Sarasti"; # Define your hostname.
      # Configure network connections interactively with nmcli or nmtui.networking.
      networkmanager = {
        enable = true;
      };
    };

    # This option defines the first version of NixOS you have installed on this particular machine,
    system.stateVersion = "26.05";
    # Pop in security icons
    security.polkit.enable = true;

    nix.settings.experimental-features = "nix-command flakes";
    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    # Set your time zone.
    time.timeZone = "Europe/Warsaw";

    nixpkgs.config.allowUnfree = true;

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
