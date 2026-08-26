{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', ... }: {

    _module.args.pkgs = import inputs.nixpkgs {
        config.allowUnfree = true;
      };

    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      settings = {
        spawn-at-startup = [
          (lib.getExe pkgs.noctalia)
          (lib.getExe pkgs.zed-editor)
          (lib.getExe pkgs.vivaldi)
          "spotify"
        ];

        prefer-no-csd = {};
        xwayland-satellite.path = lib.getExe pkgs.xwayland-satellite;
        input.keyboard.xkb.layout = "pl";
        layout.gaps = 5;
        hotkey-overlay.skip-at-startup = {};
        window-rule.open-maximized = true;


        window-rules = [
          {
            matches = [
              { app-id = "dev.zed.Zed"; }
            ];
            open-on-workspace = "1-editor";
          }

          {
            matches = [
              { app-id = "jetbrains-clion"; }
              { app-id = "org.prismlauncher.PrismLauncher"; }
              { app-id = "steam"; }
              { app-id = "anki"; }
            ];
            open-on-workspace = "2-focus";
          }

          {
            matches = [
              { app-id = "vivaldi-stable"; }
            ];
            open-on-workspace = "3-web";
          }

          {
            matches = [
              { app-id = "Spotify"; }
            ];
            open-on-workspace = "4-music";
          }
        ];

        workspaces = {
          "1-editor" = {};
          "2-focus" = {};
          "3-web" = {};
          "4-music" = {};
        };


       	outputs = {
      		"DP-3" = {
      			 mode = "1920x1080@165.003";
      			 scale = 1.0;
      		};
       	};

        binds = {
          "Mod+Z".spawn-sh = lib.getExe pkgs.alacritty;
          "Mod+Shift+Z".spawn-sh = lib.getExe pkgs.zed-editor;
          "Mod+Shift+Q".spawn-sh = lib.getExe pkgs.vivaldi;
          "Mod+Shift+E".spawn-sh = "spotify";

          "Mod+D".spawn-sh = "noctalia msg panel-toggle launcher";
          "Mod+Space".spawn-sh = "noctalia msg panel-toggle control-center";
          "Mod+V".spawn-sh = "noctalia msg settings-open";

          "Mod+X".spawn-sh = "noctalia msg screenshot-region";
          "Mod+Shift+X".spawn-sh = "noctalia msg screenshot-fullscreen";

          "Mod+U".spawn-sh = "noctalia msg session lock";
          "Mod+I".spawn-sh = "noctalia msg session logout";
          "Mod+O".spawn-sh = "noctalia msg session reboot";
          "Mod+P".spawn-sh = "noctalia msg session shutdown";

          "Mod+B".spawn-sh = "noctalia msg media previous";
          "Mod+N".spawn-sh = "noctalia msg media toggle";
          "Mod+M".spawn-sh = "noctalia msg media next";

          "Mod+Shift+B".spawn-sh = "noctalia msg volume-down";
          "Mod+Shift+N".spawn-sh = "noctalia msg volume-mute";
          "Mod+Shift+M".spawn-sh = "noctalia msg volume-up";

          "Mod+F1".show-hotkey-overlay = {};
          "Mod+Tab".toggle-overview = {};

          "Mod+C".close-window = {};
          "Mod+Shift+C".quit = {};

          "Mod+H".focus-column-left = {};
          "Mod+L".focus-column-right = {};
          "Mod+K".focus-window-up = {};
          "Mod+J".focus-window-down = {};

          "Mod+A".maximize-column = {};
          "F11".fullscreen-window = {};

          "Mod+Q".set-column-width = "-5%";
          "Mod+E".set-column-width = "+5%";
          "Mod+W".set-window-height = "-5%";
          "Mod+S".set-window-height = "+5%";

          "Mod+Shift+W".move-column-to-workspace-up = {};
          "Mod+Shift+S".move-column-to-workspace-down = {};

          "Mod+Shift+D".focus-workspace-down = {};
          "Mod+Shift+A".focus-workspace-up = {};

          "Mod+1".focus-workspace = 1;
          "Mod+2".focus-workspace = 2;
          "Mod+3".focus-workspace = 3;
          "Mod+4".focus-workspace = 4;
          "Mod+5".focus-workspace = 5;
          "Mod+6".focus-workspace = 6;
          "Mod+7".focus-workspace = 7;
          "Mod+8".focus-workspace = 8;
          "Mod+9".focus-workspace = 9;

          "Mod+Shift+H".move-column-left = {};
          "Mod+Shift+L".move-column-right = {};

          "Mod+Shift+K".move-window-up = {};
          "Mod+Shift+J".move-window-down = {};

          "Mod+G".toggle-window-floating = {};
          "Mod+T".switch-focus-between-floating-and-tiling = {};

          "Mod+Y".switch-preset-column-width = {};

          "Mod+R".consume-window-into-column = {};
          "Mod+F".expel-window-from-column = {};

          "Mod+Shift+R".consume-or-expel-window-left = {};
          "Mod+Shift+F".consume-or-expel-window-right = {};
        };
      };
    };
  };
}
