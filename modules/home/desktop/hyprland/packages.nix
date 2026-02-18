{
  flake.modules.homeManager.hyprland =
    {
      pkgs,
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
