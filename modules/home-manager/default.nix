{ self, inputs, ... }: {

  flake.modules.homeManager.default = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.modules.homeManager.git
      self.modules.homeManager.cursor
      self.modules.homeManager.bash
      self.modules.homeManager.zsh
      self.modules.homeManager.starship
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    home.username = "azex";
    home.homeDirectory = "/home/azex";


    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };

    };

    dconf.settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";   # to jest kluczowe dla apek libadwaita (GTK4)
        gtk-theme = "Adwaita-dark";     # to dla starszych apek GTK3
      };
    };



    programs.alacritty = {
      enable = true;
      settings = {
        colors = {
          primary = {
            background = "#1a1b26";
            foreground = "#c0caf5";
          };
          cursor = {
            text = "#1a1b26";
            cursor = "#c0caf5";
          };
          normal = {
            black   = "#15161e";
            red     = "#f7768e";
            green   = "#9ece6a";
            yellow  = "#e0af68";
            blue    = "#7aa2f7";
            magenta = "#bb9af7";
            cyan    = "#7dcfff";
            white   = "#a9b1d6";
          };
          bright = {
            black   = "#414868";
            red     = "#f7768e";
            green   = "#9ece6a";
            yellow  = "#e0af68";
            blue    = "#7aa2f7";
            magenta = "#bb9af7";
            cyan    = "#7dcfff";
            white   = "#c0caf5";
          };
        };
      };
    };

    home = {
      packages = with pkgs; [
        btop
        htop
        keepassxc
        vivaldi
        spotify
        anki
        fastfetch
        kdePackages.dolphin
        zed-editor
      ];
    };



  };
}
