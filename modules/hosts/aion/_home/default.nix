{ lib, ... }:
{
  imports = [
    ./kanshi.nix
    ./gtk.nix
    ./scarlet.nix
  ];
  # Unset NIXOS_OZONE_WL fixes flickering Discord on sway+Nvidia
  # https://discourse.nixos.org/t/nvidia-sway-flickering/65262/18
  # home.sessionVariables.NIXOS_OZONE_WL = lib.mkForce 0;
  # wayland.windowManager.sway.extraOptions = [ "--unsupported-gpu" ];

}
