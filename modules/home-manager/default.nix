{ self, inputs, ... }: {

  flake.modules.homeManager.default = { pkgs, lib, ... }: {
    # import any other modules from here
    imports = [
      self.modules.homeManager.git
      self.modules.homeManager.cursor
      self.modules.homeManager.bash
      self.modules.homeManager.zsh
      self.modules.homeManager.starship
      self.modules.homeManager.packages
      self.modules.homeManager.alacritty
      self.modules.homeManager.dark-theme
      self.modules.homeManager.noctalia
      self.modules.homeManager.spicetify
      self.modules.homeManager.zed
      self.modules.homeManager.clion
      self.modules.homeManager.fish
    ];
  };
}
