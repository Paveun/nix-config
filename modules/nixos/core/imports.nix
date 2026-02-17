{ config, inputs, ... }:
{
  flake.modules.nixos.core.imports = with config.flake.modules.nixos; [

    bootloader
    nh
    nix
    security
    # ssh-server
    users
    # wireguard-client
    catppuccin
  ];
}
