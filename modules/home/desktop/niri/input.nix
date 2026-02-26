{
  flake.modules.homeManager.niri = {
    programs.niri.settings.input = {
      keyboard = {
        xkb = {
          layout = "us";
        };
        numlock = true;
      };

      touchpad = {
        tap = true;
        natural-scroll = true;
      };

      focus-follows-mouse.enable = true;
      workspace-auto-back-and-forth = true;

    };
  };
}
