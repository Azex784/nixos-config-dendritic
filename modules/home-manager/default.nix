{ self, inputs, ... }: {

  flake.modules.homeManager.default = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.modules.homeManager.git
      self.modules.homeManager.cursor
      self.modules.homeManager.bash
      self.modules.homeManager.zsh
      self.modules.homeManager.starship
    ];

    home.stateVersion = "26.05";
    programs.home-manager.enable = true;
    home.username = "azex";
    home.homeDirectory = "/home/azex";
  };
}
