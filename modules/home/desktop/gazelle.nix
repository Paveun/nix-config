{
  flake.modules.homeManager.gazelle = {
    programs.gazelle = {
      enable = true;
      settings = {
        theme = "catppuccin-mocha";
      };
    };
  };
}
