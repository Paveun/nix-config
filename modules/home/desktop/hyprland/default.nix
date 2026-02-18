{
  flake.modules.homeManager.hyprland =
    { lib, ... }:
    {
      wayland.windowManager.hyprland = {
        enable = true;
        settings = {
          "$terminal" = lib.mkDefault "ghostty";
          "$fileManager" = lib.mkDefault "nautilus --new-window";
          "$browser" = lib.mkDefault "chromium --new-window --ozone-platform=wayland";
          "$music" = lib.mkDefault "spotify";
          "$passwordManager" = lib.mkDefault "1password";
          "$messenger" = lib.mkDefault "signal-desktop";
          "$webapp" = lib.mkDefault "$browser --app";

          # monitor = cfg.monitors;
        };
      };
    };
}
