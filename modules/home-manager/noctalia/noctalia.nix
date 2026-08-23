{ self, inputs, ... }: {

  flake.modules.homeManager.noctalia = { pkgs, lib, ... }: {
    imports = [
        inputs.noctalia.homeModules.default
      ];
    programs.noctalia = {
      enable = true;
      settings = ./noctalia-full-config.toml;
    };
  };
}
