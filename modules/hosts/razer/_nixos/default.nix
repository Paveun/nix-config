{
  imports = [
    # Include the results of the hardware scan.
    ./hardware.nix
    ./gaming.nix
    ./nvidia.nix
  ];

  time.hardwareClockInLocalTime = true;

  system.stateVersion = "24.05";
}
