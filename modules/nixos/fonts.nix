{ self, inputs, ... }: {
  flake.modules.nixos.fonts = { pkgs, lib, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
    ];
  };
}
