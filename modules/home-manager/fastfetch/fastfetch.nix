{ self, inputs, ... }: {

  flake.modules.homeManager.fastfetch = { pkgs, lib, ... }: {
    home.file.".config/fastfetch/config.jsonc".force = true;
    home.file.".config/fastfetch/logo/nixos.webp".force = true;

    home.file.".config/fastfetch/config.jsonc" = {
      source = ./fastfetch.jsonc;
    };

    home.file.".config/fastfetch/logo/nixos.webp" = {
      source = ./nixos.webp;
    };

    programs.fastfetch = {
      enable = true;
    };
  };
}
