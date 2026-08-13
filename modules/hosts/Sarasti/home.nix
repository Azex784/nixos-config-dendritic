{ self, inputs, ... }: {

  flake.modules.homeManager.azex = { pkgs, lib, ... }: {
   imports = [
     self.modules.homeManager.default
   ];
  };
}
