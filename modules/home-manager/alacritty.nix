{ self, inputs, ... }: {

  flake.modules.homeManager.alacritty = { pkgs, lib, ... }: {
    programs = {
      alacritty = {
        enable = true;
        settings = {
          colors = {
            # -----------------------------------------------------------------------------
            # TokyoNight Alacritty Colors
            # Theme: Tokyo Night Storm
            # Upstream: https://github.com/folke/tokyonight.nvim/raw/main/extras/alacritty/tokyonight_storm.toml
            # -----------------------------------------------------------------------------

            primary = {
              background = "#24283b";
              foreground = "#c0caf5";
            };

            normal = {
              black = "#1d202f";
              red = "#f7768e";
              green = "#9ece6a";
              yellow = "#e0af68";
              blue = "#7aa2f7";
              magenta = "#bb9af7";
              cyan = "#7dcfff";
              white = "#a9b1d6";
            };

            bright = {
              black = "#414868";
              red = "#ff899d";
              green = "#9fe044";
              yellow = "#faba4a";
              blue = "#8db0ff";
              magenta = "#c7a9ff";
              cyan = "#a4daff";
              white = "#c0caf5";
            };
          };
        };
      };
    };
  };
}
