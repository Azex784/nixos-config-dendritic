{ self, inputs, ... }: {

  flake.modules.homeManager.bash = { pkgs, lib, ... }: {
    programs = {
      bash = {
        enable = true;
        initExtra = ''
            set -o vi
            bind 'set show-mode-in-prompt on'
            bind 'set vi-cmd-mode-string "\1\e[2 q\2"' # Tryb Normal (Steady Block)
            bind 'set vi-ins-mode-string "\1\e[6 q\2"' # Tryb Insert (Steady Beam)
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
