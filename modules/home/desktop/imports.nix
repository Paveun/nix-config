{ config, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    # bg-stream
    desktop-programs
    # dunst
    ghostty
    firefox
    flameshot
    foot
    # gammastep
    # gtk
    kanshi
    keyring
    wofi
    # streaming
    # sway
    # swaylock
    udiskie
    waybar
    wayland
    # zathura
    zed-editor
    # walker
    gazelle
    wofi
    hyprland
  ];
}
