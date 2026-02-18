{
  flake.modules.homeManager.hyprland =
    { pkgs, lib, ... }:
    {
      wayland.windowManager.hyprland.settings = {
        exec-once = [
          # "hypridle & mako & waybar & fcitx5"
          # "waybar"
          # "swaybg -i ~/.config/omarchy/current/background -m fill"
          "systemctl --user import-environment"
          "${lib.getExe pkgs.hyprsunset}"
          "systemctl --user start hyprpolkitagent"
          "wl-clip-persist --clipboard regular & clipse -listen"

          # "dropbox-cli start"  # Uncomment to run Dropbox
        ];

        exec = [
          "pkill -SIGUSR2 waybar || waybar"
        ];
      };
    };
}
