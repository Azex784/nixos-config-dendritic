{ self, inputs, ... }: {

  flake.modules.homeManager.gimp = { pkgs, lib, ... }:
  {
    home.file.".config/GIMP/3.2".force = true;
    home.packages = [ pkgs.gimp ];
      home.file.".config/GIMP/3.2" = {
        source = "${inputs.photogimp}/.config/GIMP/3.0";
        recursive = true;
      };
  };
}
