{ self, inputs, ... }: {

  flake.modules.nixos.default = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.modules.nixos.bluetooth
      self.modules.nixos.boot
      self.modules.nixos.niri
      self.modules.nixos.packages
      self.modules.nixos.users
      self.modules.nixos.noctalia-greeter
      self.modules.nixos.services
      self.modules.nixos.networking
      self.modules.nixos.fonts

    ];
    # This option defines the first version of NixOS you have installed on this particular machine,
    system.stateVersion = "26.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    # Set your time zone.
    time.timeZone = "Europe/Warsaw";
    nixpkgs.config.allowUnfree = true;

  };
}
