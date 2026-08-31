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
        zed-editor
        prismlauncher
        # --> Start of Noctalia Plugins Dependencies <--
        hyprpicker
        fzf
        gh
        qrencode
        # --> End of Noctalia Plugins Dependencies <--
        steam
        neovim
        tor-browser
        proton-vpn
        # Virtual Machine
        vm-curator
        quickemu
        tailscale
        docker
        pacvim
        thunar
      ];
    };
  };
}
