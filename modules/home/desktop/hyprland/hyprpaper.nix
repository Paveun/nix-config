{
  flake.modules.homeManager.hyprland =
    { primaryUser, ... }:
    {
      home.file = {
        "/home/${primaryUser}/.config/wallpapers/wallpaper.jpeg" = {
          source = ../wallpaper.jpeg;
          recursive = true;
        };
      };
      services.hyprpaper = {
        enable = true;
        settings = {
          preload = [
            /home/${primaryUser}/.config/wallpapers/wallpaper.jpeg
          ];
          wallpaper = [
            ",/home/${primaryUser}/.config/wallpapers/wallpaper.jpeg"
          ];
        };
      };
    };
}
