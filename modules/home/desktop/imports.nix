{ config, ... }:
{
  flake.modules.homeManager.desktop.imports = with config.flake.modules.homeManager; [
    # bg-stream
    desktop-programs
    dunst
    ghostty
    firefox
    flameshot
    foot
    discord
    # gammastep
    gtk
    kanshi
    keyring
    # streaming
    # sway
    # swaylock
    udiskie
    wayland
    # zathura
    zed-editor
    # waybar
    # walker
    # gazelle
    # wofi
    # hyprland
    librepods
    niri
    noctalia
  ];
}
