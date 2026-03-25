{
  flake.modules.nixos.steam =
    {
      pkgs,
      ...
    }:
    {
      hardware.xone.enable = true;

      programs = {
        steam = {
          enable = true;

          # Open ports in the firewall for Steam Remote Play
          remotePlay.openFirewall = true;

          # Open ports in the firewall for Source Dedicated Server
          dedicatedServer.openFirewall = true;

          extraCompatPackages = with pkgs; [
            proton-ge-bin
          ];
        };

        gamescope = {
          enable = true;
          capSysNice = false;
        };
      };
      # environment.systemPackages = with pkgs; [
      #   gamescope-wsi
      # ];
    };
}
