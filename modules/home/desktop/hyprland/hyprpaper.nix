{
  flake.modules.homeManager.hyprland = {
    services.hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = [ "${../wallpaper.png}" ];
        wallpaper = {
          monitor = "";
          path = "${../wallpaper.png}";
        };
      };
    };
  };
}
