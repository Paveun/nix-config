{
  flake.modules.homeManager.gazelle =
    {
      inputs,
      pkgs,
      ...
    }:
    {
      imports = [ inputs.gazelle.homeModules.gazelle ];
      home.packages = [
        inputs.gazelle.packages.${pkgs.system}.default
      ];
      programs.gazelle = {
        enable = true;
        settings = {
          theme = "catppuccin-mocha";
        };
      };
    };
}
