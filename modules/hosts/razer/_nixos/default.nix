{
  imports = [
    # Include the results of the hardware scan.
    ./disko.nix
    ./hardware.nix
    ./nvidia.nix
  ];

  time.hardwareClockInLocalTime = true;

  system.stateVersion = "24.05";
}
