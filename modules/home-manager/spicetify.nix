{ self, inputs, ... }: {

  flake.modules.homeManager.spicetify = { pkgs, lib, ... }:
  {
    imports = [
      inputs.spicetify-nix.homeManagerModules.spicetify
    ];

    programs.spicetify =
    let
        # For Flakeless:
        # spicePkgs = spicetify-nix.packages;

        # With flakes:
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      #spotifyLaunchFlags = "ozone-platform=wayland";
      enable = true;
      windowManagerPatch = true;
      enabledExtensions = with spicePkgs.extensions; [
             adblockify
             hidePodcasts
             shuffle # shuffle+ (special characters are sanitized out of extension names)
           ];
      theme = spicePkgs.themes.tokyoNight;
      colorScheme = "Storm";
    };

  };

}
