{
  flake.modules.homeManager.niri = {
    programs.niri.settings = {
      hotkey-overlay.skip-at-startup = true;
      environment = {
        # Dark theme
        # GTK_THEME = "Adwaita:dark";

        # X11 (xwayland-satellite)
        DISPLAY = ":0";

        # Wayland
        GDK_SCALE = "1";
        XCURSOR_SIZE = "24";
        GDK_BACKEND = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        OZONE_PLATFORM = "wayland";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        XDG_SESSION_TYPE = "wayland";
        XDG_CURRENT_DESKTOP = "niri";

        QT_QPA_PLATFORM = "wayland";
        # QT_STYLE_OVERRIDE = "kvantum";
        SDL_VIDEODRIVER = "wayland";

        # XCOMPOSEFILE = "~/.XCompose";
        EDITOR = "nvim";

        # Qt theming
        QT_QPA_PLATFORMTHEME = "gtk3";
      };

      debug = {
        honor-xdg-activation-with-invalid-serial = [ ];
      };

      prefer-no-csd = true;

    };
  };
}
