{ lib, config, ... }:
{
  hardware.nvidia = {
    package = lib.mkForce config.boot.kernelPackages.nvidiaPackages.production;
    prime = {
      # offload.enable = true;
      # offload.enableOffloadCmd = true;
      sync.enable = true;
      nvidiaBusId = "PCI:1:0:0";
      intelBusId = "PCI:0:2:0";
    };
  };
}
