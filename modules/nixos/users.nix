{ self, inputs, ... }: {

  flake.modules.nixos.users = { pkgs, lib, ... }: {
    # Define a user account & packages for him
    users.users.azex = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "azex";
      extraGroups = [ "networkmanager" "wheel" "kvm" ]; # Enable ‘sudo’ for the user.
    };
  };
}
