{
  flake.modules.homeManager.niri =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    let
      inherit (lib) getExe;
      brightnessctl = getExe pkgs.brightnessctl;
      noctalia-shell = getExe config.programs.noctalia-shell.package;
      noctalia = cmd: "${noctalia-shell} ipc call ${cmd}";
      niri = getExe config.programs.niri.package;
    in
    {
      services.hypridle = {
        enable = true;
        settings = {
          general = {
            lock_cmd = noctalia "lockScreen toggle";
            before_sleep_cmd = "loginctl lock-session";
            after_sleep_cmd = "${niri} msg action power-on-monitors";
          };
          listener = [
            {
              # dim screen before lock
              timeout = 240;
              on-timeout = "${brightnessctl} -s set 80%-";
              on-resume = "${niri} msg action power-on-monitors && ${brightnessctl} -r";
            }
            {
              timeout = 300;
              on-timeout = "loginctl lock-session";
            }
            {
              timeout = 330;
              on-timeout = "${niri} msg action power-off-monitors && ${brightnessctl} -sd '*::kbd_backlight' set 0";
              on-resume = "${niri} msg action power-on-monitors && ${brightnessctl} -rd '*::kbd_backlight'";
            }
          ];
        };
      };
    };
}
