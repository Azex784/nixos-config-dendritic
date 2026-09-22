{ self, inputs, ... }: {

  flake.modules.homeManager.udiskie = { pkgs, lib, ... }:
  {
    services.udiskie = {
      enable = true;
      notify = false;
      automount = true;
      settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {

          icon_names.media = [ "media-optical" ];
          # replace with your favorite file manager
          file_manager = "kitty -e yazi";
        };
      };
    };
  };
}
