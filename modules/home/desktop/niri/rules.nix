{
  flake.modules.homeManager.niri = {
    programs.niri.settings = {
      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 8.0;
            top-right = 8.0;
            bottom-left = 8.0;
            bottom-right = 8.0;
          };
          clip-to-geometry = true;
        }
      ];
      layer-rules = [
        {
          matches = [
            {
              namespace = "^noctalia-wallpaper*";
            }
          ];
          place-within-backdrop = true;
        }
      ];
    };
  };
}
