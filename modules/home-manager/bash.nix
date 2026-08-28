{ self, inputs, ... }: {

  flake.modules.homeManager.bash = { pkgs, lib, ... }: {
    programs = {
      bash = {
        enable = true;
        shellAliases  = {
          # General
          ll = "ls -la";
          la = "ls -A";
          c = "clear";

          # Computer power managment
          sht="sudo shutdown now";
          rbt="sudo reboot now";

          # Package management
          upd = "sudo nix flake update --flake /home/azex/nixos";
          SarastiUpg = "sudo nixos-rebuild switch --impure --flake /home/azex/nixos#Sarasti";
          OmnisonUpg = "sudo nixos-rebuild switch --impure --flake /home/azex/nixos#Omnison";
          delete-cache = "sudo nix-collect-garbage";
          delete = "sudo nix-collect-garbage -d";
        };
      };
    };
  };
}
