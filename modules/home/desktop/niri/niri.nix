{
  flake.modules.homeManager.niri = {
    programs.niri.settings = {
      hotkey-overlay.skip-at-startup = true;
      environment = {
        # Dark theme
        # GTK_THEME = "Adwaita:dark";

        # Wayland
        GDK_SCALE = "1";
        XCURSOR_SIZE = "24";
        GDK_BACKEND = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "wayland";
        OZONE_PLATFORM = "wayland";

        QT_QPA_PLATFORM = "wayland";
        QT_STYLE_OVERRIDE = "kvantum";
        SDL_VIDEODRIVER = "wayland";

        XCOMPOSEFILE = "~/.XCompose";
        EDITOR = "nvim";

        # Qt theming
        QT_QPA_PLATFORMTHEME = "qt6ct";
      };

      debug = {
        honor-xdg-activation-with-invalid-serial = [ ];
      };

      prefer-no-csd = true;

    };
  };
}
