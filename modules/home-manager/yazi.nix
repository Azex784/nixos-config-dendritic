{ self, inputs, ... }: {

  flake.modules.homeManager.yazi = { pkgs, lib, ... }: {
    # Dependencies for yazi
    home.packages = with pkgs; [
      ffmpegthumbnailer
      p7zip
      poppler
      jq
      fd
      ripgrep
      zoxide
      ueberzugpp
    ];

    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
    };
  };
}
