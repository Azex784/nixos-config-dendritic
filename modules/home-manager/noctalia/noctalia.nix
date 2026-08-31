{ self, inputs, ... }: {

  flake.modules.homeManager.noctalia = { pkgs, lib, ... }: {
    imports = [
        inputs.noctalia.homeModules.default
      ];

    home = {
      packages = with pkgs; [
      hyprpicker
      fzf
      gh
      qrencode
      ];
    };

    programs.noctalia = {
      enable = true;
      settings = ./noctalia-full-config.toml;
    };
  };
}
