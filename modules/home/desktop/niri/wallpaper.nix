{
  flake.modules.homeManager.niri-testing =
    { lib, pkgs, ... }:
    {
      systemd.user.services.swaybg = {
        Unit = {
          Description = "Wallpaper daemon for Wayland";
          PartOf = [ "graphical-session.target" ];
          After = [ "graphical-session.target" ];
        };
        Service = {
          ExecStart = "${lib.getExe pkgs.swaybg} -i ${../wallpaper.png} -m fill";
          Restart = "on-failure";
        };
        Install = {
          WantedBy = [ "graphical-session.target" ];
        };
      };
    };
}
