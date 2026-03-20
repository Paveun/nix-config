{
  flake.modules.homeManager.core = {
    programs.television = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        tick_rate = 50;
        ui = {
          use_nerd_font_icons = true;
          ui_scale = 120;
          # show_preview_panel = false;
        };
        keybindings = {
          "esc" = "quit";
          "ctrl-c" = "quit";
        };
      };
    };
  };
}
