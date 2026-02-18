{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      windowrulee = [
        # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
        "suppress_event maximize, match:class .*"

        # Settings management
        "float, class:^(org.pulseaudio.pavucontrol|blueberry.py)$"

        # Define terminal tag to style them uniformly
        "tag +terminal, match:class (Alacritty|kitty|com.mitchellh.ghostty)"
        "tag -default-opacity, match:tag terminal"
        "opacity 0.97 0.9, match:tag terminal"
        "match:class (Alacritty|kitty), scroll_touchpad 1.5"
        "match:class com.mitchellh.ghostty, scroll_touchpad 0.2"

        # Steam
        "float on, match:class steam"
        "center on, match:class steam, match:title Steam"
        "tag -default-opacity, match:class steam.*"
        "opacity 1 1, match:class steam.*"
        "size 1100 700, match:class steam, match:title Steam"
        "size 460 800, match:class steam, match:title Friends List"
        "idle_inhibit fullscreen, match:class steam"

        # Browser types
        "tag +chromium-based-browser, match:class ((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)"
        "tag +firefox-based-browser, match:class ([fF]irefox|zen|librewolf)"
        "tag -default-opacity, match:tag chromium-based-browser"
        "tag -default-opacity, match:tag firefox-based-browser"

        # Video apps: remove chromium browser tag so they don't get opacity applied
        "tag -chromium-based-browser, match:class (chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)"
        "tag -default-opacity, match:class (chrome-youtube.com__-Default|chrome-app.zoom.us__wc_home-Default)"

        # Force chromium-based browsers into a tile to deal with --app bug
        "tile on, match:tag chromium-based-browser"

        # Only a subtle opacity change, but not for video sites
        "opacity 1.0 0.97, match:tag chromium-based-browser"
        "opacity 1.0 0.97, match:tag firefox-based-browser"

        # Floating windows
        "float on, match:tag floating-window"
        "center on, match:tag floating-window"
        "size 875 600, match:tag floating-window"

        "tag +floating-window, match:class (org.omarchy.bluetui|org.omarchy.impala|org.omarchy.wiremix|org.omarchy.btop|org.omarchy.terminal|org.omarchy.bash|org.gnome.NautilusPreviewer|org.gnome.Evince|com.gabm.satty|Omarchy|About|TUI.float|imv|mpv)"
        "tag +floating-window, match:class (xdg-desktop-portal-gtk|sublime_text|DesktopEditors|org.gnome.Nautilus), match:title ^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)"
        "float on, match:class org.gnome.Calculator"

        # Fullscreen screensaver
        "fullscreen on, match:class org.omarchy.screensaver"
        "float on, match:class org.omarchy.screensaver"

        # No transparency on media windows
        "tag -default-opacity, match:class ^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$"
        "opacity 1 1, match:class ^(zoom|vlc|mpv|org.kde.kdenlive|com.obsproject.Studio|com.github.PintaProject.Pinta|imv|org.gnome.NautilusPreviewer)$"

        # Popped window rounding
        " rounding 8, match:tag pop"

        # Prevent idle while open
        "idle_inhibit always, match:tag noidle"
      ];

      layerrule = [
        # Proper background blur for wofi
        "blur on, match:namespace wofi"
        "blur on, match:namespace waybar"
      ];
    };
  };
}
