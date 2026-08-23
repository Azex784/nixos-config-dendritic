{ self, inputs, ... }: {

  flake.modules.homeManager.spicetify = { pkgs, lib, ... }:
  {
    imports = [
      inputs.spicetify-nix.homeManagerModules.spicetify
    ];

    programs.spicetify =
    let
        # With flakes:
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
    in
    {
      enable = true;
      windowManagerPatch = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblockify
        hidePodcasts
        shuffle
        fullAlbumDate
        betterGenres
        aiBandBlocker
      ];

      enabledCustomApps = with spicePkgs.apps; [
        newReleases
        ncsVisualizer
        lyricsPlus
        nameThatTune
      ];

      enabledSnippets = with spicePkgs.snippets; [
        rotatingCoverart
        pointer
        dancingHamster
      ];

      theme = spicePkgs.themes.starryNight;
    };
  };
}
