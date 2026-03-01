{ config, inputs, ... }:
{
  flake.modules.nixos.core.imports = with config.flake.modules.nixos; [
    inputs.disko.nixosModules.disko
    bootloader
    nh
    nix
    security
    # ssh-server
    users
    # wireguard-client
    stylix
    # catppuccin
    tailscale
  ];
}
