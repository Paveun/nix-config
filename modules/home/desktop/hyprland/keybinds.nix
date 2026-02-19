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
          # light = getExe pkgs.light;
          pactl = getExe' pkgs.pulseaudio "pactl";
          playerctl = getExe pkgs.playerctl;
          wofi = getExe config.programs.wofi.package;
          hyprshot = getExe pkgs.hyprshot;
          hyprpicker = getExe pkgs.hyprpicker;
          brightnessctl = getExe pkgs.brightnessctl;
          # hyprctl = getExe' config.wayland.windowManager.hyprland.package "hyprctl";
        in
        {
          "$mod" = mod;
          bind = [

            "$mod, F, exec, firefox"
            "$mod, Print, exec, grimblast copy area"
            # Dunst (notifications)
            "$mod, n, exec, ${dunst} set-paused false"
            "$mod SHIFT, n, exec, ${dunst} set-paused true"
            # Applications
            "$mod, return, exec, ${ghostty}"
            "$mod, space, exec, ${wofi} --show drun"
            "$mod SHIFT, SPACE, exec, pkill -SIGUSR1 waybar"
            # Window Management
            "$mod, W, killactive,"
            "$mod, J, togglesplit, # dwindle"
            "$mod, P, pseudo, # dwindle"
            "$mod, V, togglefloating,"
            "$mod SHIFT, Plus, fullscreen,"
            "$mod, left, movefocus, l"
            "$mod, right, movefocus, r"
            "$mod, up, movefocus, u"
            "$mod, down, movefocus, d"
            "$mod SHIFT, left, swapwindow, l"
            "$mod SHIFT, right, swapwindow, r"
            "$mod SHIFT, up, swapwindow, u"
            "$mod SHIFT, down, swapwindow, d"
            "$mod, minus, resizeactive, -100 0"
            "$mod, equal, resizeactive, 100 0"
            "$mod SHIFT, minus, resizeactive, 0 -100"
            "$mod SHIFT, equal, resizeactive, 0 100"
            # Screenshots
            ", PRINT, exec, ${hyprshot} -m region"
            "SHIFT, PRINT, exec, ${hyprshot} -m window"
            "CTRL, PRINT, exec, ${hyprshot} -m output"
            # Color picker
            "$mod, PRINT, exec, ${hyprpicker} -a"

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
          bindl = [
            # Requires playerctl
            ", XF86AudioNext, exec, ${playerctl} next"
            ", XF86AudioPause, exec, ${playerctl} play-pause"
            ", XF86AudioPlay, exec, ${playerctl} play-pause"
            ", XF86AudioPrev, exec, ${playerctl} previous"
          ];
          bindel = [
            # Laptop multimedia keys for volume and LCD brightness
            ",XF86AudioRaiseVolume, exec, ${pactl} set-sink-volume @DEFAULT_SINK@ +5%"
            ",XF86AudioLowerVolume, exec, ${pactl} set-sink-volume @DEFAULT_SINK@ -5%"
            ",XF86AudioMute, exec, ${pactl} set-sink-mute @DEFAULT_SINK@ toggle"
            ",XF86AudioMicMute, exec, ${pactl} set-source-mute @DEFAULT_SOURCE@ toggle"
            ",XF86MonBrightnessUp, exec, ${brightnessctl} -e4 -n2 set 5%+"
            ",XF86MonBrightnessDown, exec, ${brightnessctl} -e4 -n2 set 5%-"
          ];
        };
    };
}
