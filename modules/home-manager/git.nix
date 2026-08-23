{ self, inputs, ... }: {

  flake.modules.homeManager.git = { pkgs, lib, ... }: {
    programs = {
      git = {
        enable = true;
        settings = {
          user = {
            name = "azex";
            email = "azex784205@gmail.com";
          };
        };
      };
    };
  };
}
