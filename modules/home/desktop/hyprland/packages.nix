{
  flake.modules.homeManager.hyprland =
    {
      pkgs,
      config,
      lib,
      ...
    }:
    {
      home.packages = with pkgs; [
        pamixer
        gnome-themes-extra
        pavucontrol
        chromium
      ];
    };
}
