{
  flake.modules.homeManager.noctalia =
    { pkgs, inputs, ... }:
    {
      # import the home manager module
      imports = [
        inputs.noctalia.homeModules.default
      ];

      # configure options
      programs.noctalia-shell = {
        enable = true;
        # systemd.enable = true;
        settings = {
          settingsVersion = 0;
          network.bluetoothAutoConnect = false;
          bar = {
            barType = "simple";
            position = "top";
            monitors = [ ];
            density = "default";
            showOutline = false;
            showCapsule = true;
            # capsuleOpacity = 1;
            capsuleColorKey = "none";
            widgetSpacing = 6;
            contentPadding = 0;
            fontScale = 1;
            # backgroundOpacity = 0.93;
            useSeparateOpacity = false;
            floating = false;
            marginVertical = 4;
            marginHorizontal = 4;
            frameThickness = 8;
            frameRadius = 12;
            outerCorners = false;
            hideOnOverview = false;
            displayMode = "always_visible";
            autoHideDelay = 500;
            autoShowDelay = 150;
            showOnWorkspaceSwitch = true;
            widgets = {
              left = [
                {
                  id = "Launcher";
                }
                {
                  id = "Clock";
                }
                {
                  id = "SystemMonitor";
                }
                {
                  id = "ActiveWindow";
                }
                {
                  id = "MediaMini";
                }
              ];
              center = [
                {
                  id = "Workspace";
                }
              ];
              right = [
                {
                  id = "Tray";
                }
                {
                  id = "NotificationHistory";
                }
                {
                  id = "Battery";
                }
                {
                  id = "Volume";
                }
                {
                  id = "Brightness";
                }
                {
                  id = "ControlCenter";
                }
              ];
            };
            screenOverrides = [ ];
          };
          # colorSchemes.predefinedScheme = "Catppuccin";
          # general = {
          #   avatarImage = "/home/drfoobar/.face";
          #   radiusRatio = 0.2;
          # };
          location = {
            monthBeforeDay = true;
            name = "Montreal, Canada";
          };
        };
        # this may also be a string or a path to a JSON file.
      };
      home.file.".cache/noctalia/wallpapers.json" = {
        text = builtins.toJSON {
          defaultWallpaper = "${./wallpaper.png}";
          # wallpapers = {
          #   "DP-1" = "/path/to/monitor/wallpaper.png";
          # };
        };
      };
    };
}
