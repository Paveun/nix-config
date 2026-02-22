{
  flake.modules.homeManager.hyprland = {
    programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          no_fade_in = false;
        };
        auth = {
          fingerprint.enabled = true;
        };
        background = {
          monitor = "";
          # path = "screenshot";
          path = "${../wallpaper.jpeg}";
          blur_passes = 3;
          blur_size = 8;
          # brightness = 0.5;
        };

        input-field = {
          monitor = "";
          size = "600, 100";
          position = "0, 0";
          halign = "center";
          valign = "center";

          inner_color = "rgb(30, 30, 46)";
          outer_color = "rgb(245, 224, 220)"; # #d3c6aa
          outline_thickness = 4;

          font_family = "JetbrainsMono Nerd Font";
          font_size = 32;
          font_color = "rgb(205, 214, 244)";

          placeholder_color = "rgb(166, 173, 200)";
          placeholder_text = "  Enter Password 󰈷 ";
          check_color = "rgba(131, 192, 146, 1.0)";
          fail_text = "Wrong";

          rounding = 0;
          shadow_passes = 0;
          fade_on_empty = false;
        };

        label = {
          monitor = "";
          text = "\$FPRINTPROMPT";
          text_align = "center";
          color = "rgb(211, 198, 170)";
          font_size = 24;
          font_family = "JetbrainsMono Nerd Font";
          position = "0, -100";
          halign = "center";
          valign = "center";
        };
      };
    };
  };
}
