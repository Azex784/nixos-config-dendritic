{ self, inputs, ... }: {

  flake.modules.homeManager.clion = { pkgs, lib, ... }:
  let
    plugins = inputs.nix-jetbrains-plugins.lib.pluginsForIde pkgs pkgs.jetbrains.clion [
      "com.redhat.devtools.lsp4ij"
      "nix-idea"
      "PlantUML integration"
      "com.plsft.tokyonight"
    ];
  in
  {
    home.packages = with pkgs; [
      # PlantUML dependency
       graphviz
      (jetbrains.plugins.addPlugins jetbrains.clion (lib.attrValues plugins))
    ];
  };
}
