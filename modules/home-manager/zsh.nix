{ self, inputs, ... }: {

  flake.modules.homeManager.zsh = { pkgs, lib, ... }: {
    programs.zsh = {
      initContent = ''
          if [[ $- == *i* ]]; then
                fastfetch
          fi
          printf '\e[4 q'
      '';
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 10000;

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
}
