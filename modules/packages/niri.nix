{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', ... }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe self'.packages.myNoctalia)
      ];
        prefer-no-csd = {};
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        input.keyboard.xkb.layout = "pl";
        layout.gaps = 5;

       	outputs = {
      		"DP-3" = {
      			 mode = "1920x1080@165.003";
      			 scale = 1.0;
      		};
       	};

        binds = {
          "Mod+Z".spawn-sh = lib.getExe pkgs.alacritty;

          "Mod+X".screenshot-window = {};
          # "Mod+X".spawn-sh = lib.getExe pkgs.zed;
          # "Mod+V".spawn-sh = lib.getExe pkgs.vivaldi;

          "Mod+C".close-window = {};

          "Mod+Left".focus-column-left = {};
          "Mod+Right".focus-column-right = {};
          "Mod+Up".focus-window-up = {};
          "Mod+Down".focus-window-down = {};

          "Mod+A".maximize-column = {};
          "Mod+D".fullscreen-window = {};

          "Mod+Q".set-column-width = "-5%";
          "Mod+E".set-column-width = "+5%";
          "Mod+W".set-window-height = "-5%";
          "Mod+S".set-window-height = "+5%";

          "Mod+Shift+W".move-column-to-workspace-up = {};
          "Mod+Shift+S".move-column-to-workspace-down = {};

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;

          "Mod+Shift+Left".move-column-left = {};
          "Mod+Shift+Right".move-column-right = {};

          "Mod+Shift+Up".move-window-up = {};
          "Mod+Shift+Down".move-window-down = {};

          "Mod+R".consume-window-into-column = {};
          "Mod+F".expel-window-from-column = {};
        };
      };
    };
  };
}
