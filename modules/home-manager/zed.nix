{ self, inputs, ... }: {

  flake.modules.homeManager.zed = { pkgs, lib, ... }: {
    programs.zed-editor = {
      enable = true;
      extensions = [ "nix" "toml" "rust" "tokyo-night" ];
      userSettings = {
        vim_mode = true;
        theme = {
          mode = "dark";
          light = "Tokyo Night Storm";
          dark = "Tokyo Night Storm";
        };
      };
    };
  };
}
