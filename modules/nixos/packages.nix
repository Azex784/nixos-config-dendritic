{ self, inputs, ... }: {

  flake.modules.nixos.packages = { pkgs, lib, ... }: {
    programs = {
      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      zsh.enable = true;
      mtr.enable = true;
      bash = {
        enable = true;
      };
      gnupg.agent  = {
        enable = true;
        enableSSHSupport = true;
      };
    };

    environment = {
      systemPackages = with pkgs; [
        efibootmgr
        arch-install-scripts
        gparted

        zed-editor
        alacritty
        btop
        htop
        keepassxc
        vivaldi
        spotify
        anki
        fastfetch
      ];
    };
  };
}
