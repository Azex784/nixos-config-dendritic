{ self, inputs, ... }: {

  flake.modules.homeManager.cursor = { pkgs, lib, ... }: {
    home =  {
      # Cursor
      pointerCursor = {
        enable = true;
        package = pkgs.nordzy-cursor-theme;
        name = "Nordzy-cursors";
        size = 24;
        gtk.enable = true;         # GTK 3/4
        x11.enable = true;         # XWayland / libXcursor
      };
    };
  };
}
