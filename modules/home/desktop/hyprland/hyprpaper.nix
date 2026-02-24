{
  flake.modules.homeManager.hyprland =
    { primaryUser, ... }:
    let
      wallpaperRelPath = ".config/wallpaper.png";
      wallpaperPath = "/home/${primaryUser}/${wallpaperRelPath}";
    in
    {
      home.file."${wallpaperRelPath}".source = ../wallpaper.jpeg;

      services.hyprpaper = {
        enable = true;
        settings = {
          splash = false;
          preload = [ wallpaperPath ];
          wallpaper = {
            monitor = "";
            path = "${wallpaperPath}";
          };
        };
      };
    };
}
