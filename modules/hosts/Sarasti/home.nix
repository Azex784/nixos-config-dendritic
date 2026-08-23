{ self, inputs, ... }: {

  flake.modules.homeManager.azex = { pkgs, lib, ... }: {
   imports = [
     self.modules.homeManager.default
   ];

   home.stateVersion = "26.05";
   programs.home-manager.enable = true;
   home.username = "azex";
   home.homeDirectory = "/home/azex";

  };
}
