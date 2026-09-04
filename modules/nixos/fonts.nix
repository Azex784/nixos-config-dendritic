{ self, inputs, ... }: {
  flake.modules.nixos.fonts = { pkgs, lib, ... }: {
    fonts.packages = with pkgs; [
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      jetbrains-mono
      nerd-fonts.symbols-only
    ];
  };
}
