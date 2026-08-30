{ self, inputs, ... }: {

  flake.modules.homeManager.bash = { pkgs, lib, ... }: {
    programs = {
      bash = {
        enable = true;
        initExtra = ''
            set -o vi
          '';

        shellAliases  = {
          # General
          ll = "ls -la";
          la = "ls -A";
          c = "clear";

          # Computer power managment
          sht="sudo shutdown now";
          rbt="sudo reboot now";
        };
      };
    };
  };
}
