{ self, inputs, ... }: {

  flake.modules.homeManager.dark-theme = { pkgs, lib, ... }: {
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
  };
}
