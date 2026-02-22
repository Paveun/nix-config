{
  flake.modules.homeManager.discord = {
    programs.discord = {
      enable = true;
      settings = {
        SKIP_HOST_UPDATE = true;
      };
      # enableWayland = true;
    };
  };
}
