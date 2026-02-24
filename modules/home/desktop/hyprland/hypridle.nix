{
  flake.modules.homeManager.hyprland =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    let
      inherit (lib) getExe getExe';
      brightnessctl = getExe pkgs.brightnessctl;
      hyprctl = getExe' config.wayland.windowManager.hyprland.package "hyprctl";
      hyprlock = getExe config.programs.hyprlock.package;
    in
    {
      services.hypridle = {
        enable = true;
        settings = {
          general = {
            lock_cmd = "pidof ${hyprlock} || ${hyprlock}";
            before_sleep_cmd = "loginctl lock-session";
            after_sleep_cmd = "${hyprctl} dispatch dpms on";
          };
          listener = [
            {
              # dim screen before lock
              timeout = 240;
              on-timeout = "${brightnessctl} -s set 80%-";
              on-resume = "${hyprctl} dispatch dpms on && ${brightnessctl} -r";
            }
            {
              timeout = 300;
              on-timeout = "loginctl lock-session";
            }
            {
              timeout = 330;
              on-timeout = "${hyprctl} dispatch dpms off && ${brightnessctl} -sd '*::kbd_backlight' set 0";
              on-resume = "${hyprctl} dispatch dpms on && ${brightnessctl} -rd '*::kbd_backlight'";
            }
          ];
        };
      };
    };
}
