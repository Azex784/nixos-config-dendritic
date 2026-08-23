{ self, inputs, ... }: {

  flake.modules.homeManager.packages = { pkgs, lib, ... }: {
    home = {
      packages = with pkgs; [
        btop
        htop
        keepassxc
        vivaldi
        anki
        fastfetch
        kdePackages.dolphin
        zed-editor
        lunar-client
        # Plugins
        hyprpicker
        fzf
        gh
      ];
    };

  };
}
