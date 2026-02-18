{
  flake.modules.homeManager.walker = {
    services.walker = {
      enable = true;
      systemd.enable = true;
      settings = {
        force_keyboard_focus = true;
        selection_wrap = true;
        hide_action_hints = true;
        placeholders.default = {
          input = " Search...";
          list = "No Results";
        };
        columns.symbols = 1;
      };
    };
  };
}
