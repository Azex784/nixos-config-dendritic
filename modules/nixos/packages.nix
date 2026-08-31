{ self, inputs, ... }: {

  flake.modules.nixos.packages = { pkgs, lib, ... }: {
    # Pop in security icons
    security.polkit.enable = true;
    programs = {
      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      steam.enable = true;
      zsh.enable = true;
      fish.enable = true;
      mtr.enable = true;
      dconf.enable = true;
      bash.enable = true;
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
        noctalia
        jq
        e2fsprogs
        exfatprogs
      ];
    };
  };
}
