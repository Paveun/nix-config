{
  flake.modules.homeManager.dunst =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        libnotify
      ];

      services.dunst = {
        enable = true;

        # For settings: man dunst.5
        # also available here: https://github.com/dunst-project/dunst/blob/master/docs/dunst.5.pod
        settings = {
          ###################
          # Global settings #
          ###################

          global = {
            # dynamic width from 0 to 300
            # width = (0, 300)
            # constant width of 300
            width = "(350, 800)";

            # The maximum height of a single notification, excluding the frame.
            height = "(0, 300)";

            # Offset from the origin
            offset = "(15, 15)";

            # Horizontal padding.
            horizontal_padding = 10;

            # Defines color of the frame around the notification window.
            # frame_color = "#ebdbb2";

            font = "JetBrainsMono Nerd Font 11";

            format = "%s %p\\n%b";

            # Math all notifications (low, normal and critical)
            # background = "#282828";
            # foreground = "#ffffff";
            timeout = 2;
          };

          ##################
          # Specific rules #
          ##################

          urgency_low = { };

          urgency_normal = { };

          urgency_critical = {
            frame_color = "#cc241d";
            timeout = 0;
          };
        };
      };
    };
}
