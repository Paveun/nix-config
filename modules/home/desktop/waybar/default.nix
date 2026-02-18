{
  flake.modules.homeManager.waybar =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    {
      services = {
        blueman-applet.enable = true;
        network-manager-applet.enable = true;
      };

      programs.waybar = {
        enable = true;

        settings.main = {
          reload_style_on_change = true;
          layer = "top";
          position = "top";
          height = 26;
          spacing = 0;

          # fixed-center = false;

          modules-left = [
            "hyprland/workspaces"
          ];
          modules-center = [
            "clock"
          ];
          modules-right = [
            # "custom/dropbox"
            "group/tray-expander"
            "bluetooth"
            "network"
            "wireplumber"
            "cpu"
            # "power-profiles-daemon"
            "battery"
          ];
        }
        // (import ./_modules { inherit lib config pkgs; });
        style = builtins.readFile ./style.css;
      };
    };
}
