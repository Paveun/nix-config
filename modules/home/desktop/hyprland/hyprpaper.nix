{
  flake.modules.homeManager.hyprland =
    { primaryUser, ... }:
    let
      wallpaperPath = "/home/${primaryUser}/.config/wallpaper.jpeg";
    in
    {
      home.file."${wallpaperPath}".source = ../wallpaper.jpeg;

      services.hyprpaper = {
        enable = true;
        settings = {
          preload = [ wallpaperPath ];
          wallpaper = [ ",${wallpaperPath}" ];
        };
      };
    };
}
