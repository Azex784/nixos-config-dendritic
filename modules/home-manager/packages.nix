{ self, inputs, ... }: {

  flake.modules.homeManager.packages = { pkgs, lib, ... }: {
    services.mpris-proxy.enable = true;
    services.syncthing.enable = true;

    home = {
      packages = with pkgs; [
        btop
        htop
        keepassxc
        vivaldi
        anki
        zed-editor
        prismlauncher
        steam
        neovim
        tor-browser
        proton-vpn
        # Virtual Machine
        vm-curator
        qemu
        tailscale
        docker
        pacvim
        libreoffice
        vlc
        mpv
        yt-dlp
        audacity
      ];
    };
  };
}
