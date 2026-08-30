{ self, inputs, ... }: {

  flake.modules.homeManager.fish = { pkgs, lib, ... }: {
    home.packages = with pkgs; [
          grc
          fzf
          fd
          bat
    ];

    programs.fish = {
      enable = true;
      interactiveShellInit = ''
          fastfetch
          set fish_greeting
          fish_vi_key_bindings
          set -g fish_key_bindings fish_vi_key_bindings
      '';

      plugins = [
         # Enable a plugin (here grc for colorized command output) from nixpkgs
         { name = "grc"; src = pkgs.fishPlugins.grc.src; }
         { name = "autopair"; src = pkgs.fishPlugins.autopair.src; }
         { name = "done"; src = pkgs.fishPlugins.done.src; }
         { name = "fzf"; src = pkgs.fishPlugins.fzf.src; }
       ];

      shellAbbrs = {
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
