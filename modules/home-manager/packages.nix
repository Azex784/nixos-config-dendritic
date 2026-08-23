{ self, inputs, ... }: {

  flake.modules.homeManager.packages = { pkgs, lib, ... }: {
    services.mpris-proxy.enable = true;

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
	prismlauncher
        # --> Start of Noctalia Plugins Dependencies <--
        hyprpicker
        fzf
        gh
        # --> End of Noctalia Plugins Dependencies <--
        jetbrains.clion
        steam
        neovim
      ];
    };

  };
}
