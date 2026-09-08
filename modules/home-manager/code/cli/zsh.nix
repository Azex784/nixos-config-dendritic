{ self, inputs, ... }: {

  flake.modules.homeManager.zsh = { pkgs, lib, ... }: {
    programs.zsh = {
      enable = true;
      initContent = ''
          if [[ $- == *i* ]]; then
                fastfetch
          fi
          printf '\e[4 q'
      '';
      defaultKeymap = "viins";
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      history.size = 10000;
      plugins = [
        {
          name = "zsh-vi-mode";
          src = pkgs.zsh-vi-mode;
          file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
        }
      ];

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
}
