{
  flake.modules.homeManager.hyprland =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      wayland.windowManager.hyprland.settings =
        let
          mod = "SUPER";

          inherit (lib) getExe getExe';
          dunst = getExe config.services.dunst.package;
          ghostty = getExe config.programs.ghostty.package;
          light = getExe pkgs.light;
          pactl = getExe' pkgs.pulseaudio "pactl";
          playerctl = getExe pkgs.playerctl;
          hyprctl = getExe' config.wayland.windowManager.hyprland.package "hyprctl";
        in
        {
          "$mod" = mod;
          bind = [

            "$mod, F, exec, firefox"
            "$mod, Print, exec, grimblast copy area"
            # Dunst (notifications)
            "$mod, n, exec ${dunst} set-paused false"
            "$mod, Shift, n, exec ${dunst} set-paused true"
            # Applications
            "$mod, return, exec ${ghostty}"
          ]
          ++ (
            # workspaces
            # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
            builtins.concatLists (
              builtins.genList (
                i:
                let
                  ws = i + 1;
                in
                [
                  "$mod, code:1${toString i}, workspace, ${toString ws}"
                  "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                ]
              ) 9
            )
          );
        };
    };
}
