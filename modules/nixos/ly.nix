{ self, inputs, ... }: {
  flake.modules.nixos.ly = { pkgs, lib, ... }: {
    services.displayManager.ly = {
      enable = true;
      settings = {
        clear_password = true;
        save = true;
        clock = "%Y-%m-%d %H:%M";
        animation = "cmatrix";
      };
    };

  };
}
