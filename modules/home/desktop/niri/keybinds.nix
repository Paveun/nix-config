{
  flake.modules.homeManager.niri =
    {
      lib,
      pkgs,
      config,
      ...
    }:

    let
      noctalia =
        cmd:
        [
          "noctalia-shell"
          "ipc"
          "call"
        ]
        ++ (pkgs.lib.splitString " " cmd);

      inherit (lib) getExe getExe';
      ghostty = getExe config.programs.ghostty.package;
      brightnessctl = getExe pkgs.brightnessctl;
      playerctl = getExe pkgs.playerctl;

      # Generate workspace keybinds for 1-9
      workspaceBinds = builtins.listToAttrs (
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
              key = toString ws;
            in
            [
              {
                name = "Mod+${key}";
                value.action.focus-workspace = ws;
              }
              {
                name = "Mod+Shift+${key}";
                value.action.move-window-to-workspace = ws;
              }
            ]
          ) 9
        )
      );
    in
    {
      programs.niri.settings.binds =
        with config.lib.niri.actions;
        {
          # ── Applications ──────────────────────────────────────────
          "Mod+Return".action.spawn = "${ghostty}";
          "Mod+F".action.spawn = "thunar";

          # ── Noctalia integration ──────────────────────────────────
          "Mod+Space".action.spawn = noctalia "launcher toggle";
          "Mod+P".action.spawn = noctalia "sessionMenu toggle";
          "Mod+L".action.spawn = noctalia "lockScreen lock";

          # ── Window management ─────────────────────────────────────
          "Mod+W".action = close-window;
          "Mod+V".action = toggle-window-floating;
          "Mod+Shift+Plus".action = fullscreen-window;
          "Mod+R".action = switch-preset-column-width;
          "Mod+Shift+R".action = switch-preset-window-height;
          "Mod+Shift+F".action = maximize-column;

          # ── Focus navigation ──────────────────────────────────────
          "Mod+Left".action = focus-column-left;
          "Mod+Right".action = focus-column-right;
          "Mod+Up".action = focus-window-or-workspace-up;
          "Mod+Down".action = focus-window-or-workspace-down;

          # ── Move windows ──────────────────────────────────────────
          "Mod+Shift+Left".action = move-column-left;
          "Mod+Shift+Right".action = move-column-right;
          "Mod+Shift+Up".action = move-window-up-or-to-workspace-up;
          "Mod+Shift+Down".action = move-window-down-or-to-workspace-down;

          # ── Column management ─────────────────────────────────────
          "Mod+Comma".action = consume-window-into-column;
          "Mod+Period".action = expel-window-from-column;

          # ── Monitor focus ─────────────────────────────────────────
          "Mod+Ctrl+Left".action = focus-monitor-left;
          "Mod+Ctrl+Right".action = focus-monitor-right;
          "Mod+Ctrl+Shift+Left".action = move-window-to-monitor-left;
          "Mod+Ctrl+Shift+Right".action = move-window-to-monitor-right;

          # ── Workspace navigation ──────────────────────────────────
          "Mod+Tab".action = focus-workspace-down;
          "Mod+Shift+Tab".action = focus-workspace-up;

          # ── Resize ────────────────────────────────────────────────
          "Mod+Minus".action.set-column-width = "-10%";
          "Mod+Equal".action.set-column-width = "+10%";
          "Mod+Shift+Minus".action.set-window-height = "-10%";
          "Mod+Shift+Equal".action.set-window-height = "+10%";

          # ── Screenshots (niri built-in) ───────────────────────────
          "Print".action.screenshot = { };
          "Shift+Print".action.screenshot-window = { };
          "Ctrl+Print".action.screenshot-screen = {
            show-pointer = false;
          };

          # ── Overview & session ────────────────────────────────────
          "Mod+O".action = toggle-overview;
          "Mod+Shift+Slash".action = show-hotkey-overlay;
          "Mod+Shift+E".action.quit.skip-confirmation = true;

          # ── Volume (via noctalia) ─────────────────────────────────
          "XF86AudioRaiseVolume".action.spawn = noctalia "volume increase";
          "XF86AudioLowerVolume".action.spawn = noctalia "volume decrease";
          "XF86AudioMute".action.spawn = noctalia "volume muteOutput";

          # ── Brightness ────────────────────────────────────────────
          "XF86MonBrightnessUp".action.spawn = [
            "${brightnessctl}"
            "-e4"
            "-n2"
            "set"
            "5%+"
          ];
          "XF86MonBrightnessDown".action.spawn = [
            "${brightnessctl}"
            "-e4"
            "-n2"
            "set"
            "5%-"
          ];

          # ── Media controls ────────────────────────────────────────
          "XF86AudioNext".action.spawn = [
            "${playerctl}"
            "next"
          ];
          "XF86AudioPrev".action.spawn = [
            "${playerctl}"
            "previous"
          ];
          "XF86AudioPlay".action.spawn = [
            "${playerctl}"
            "play-pause"
          ];
          "XF86AudioPause".action.spawn = [
            "${playerctl}"
            "play-pause"
          ];
        }
        // workspaceBinds;
    };
}
