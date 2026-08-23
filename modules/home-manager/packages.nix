{ self, inputs, ... }: {

  flake.modules.homeManager.packages = { pkgs, lib, ... }: {
    home = {
      packages = with pkgs; [
        btop
        htop
        keepassxc
        vivaldi
        spotify
        anki
        fastfetch
        kdePackages.dolphin
        zed-editor
      ];
    };

  };
}
