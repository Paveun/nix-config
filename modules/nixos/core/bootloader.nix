{
  flake.modules.nixos.bootloader =
    { lib, pkgs, ... }:
    {
      boot = {
        loader = {
          limine = {
            enable = true;
            maxGenerations = 15;
          };

          efi.canTouchEfiVariables = true;

          timeout = lib.mkDefault 10;
        };
        consoleLogLevel = 3;
        initrd.verbose = false;
        initrd.systemd.enable = true;
        kernelParams = [
          "quiet"
          "udev.log_level=3"
          "systemd.show_status=auto"
        ];
        plymouth = {
          enable = true;
          font = "${pkgs.nerd-fonts.jetbrains-mono}/share/fonts/truetype/NerdFonts/JetBrainsMono/JetBrainsMonoNerdFont-Regular.ttf";
        };
      };
    };
}
