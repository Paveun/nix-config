{
  flake.modules.nixos.bootloader =
    { lib, ... }:
    {
      boot.loader = {
        limine = {
          enable = true;
          maxGenerations = 15;
        };

        efi.canTouchEfiVariables = true;

        timeout = lib.mkDefault 10;
      };
    };
}
