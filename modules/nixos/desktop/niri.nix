{
  flake.modules.nixos.niri =
    { pkgs, inputs, ... }:
    {
      imports = [
        inputs.niri.nixosModules.niri
      ];
      nixpkgs.overlays = [ inputs.niri.overlays.niri ];
      programs.niri = {
        enable = true;
      };
      niri-flake.cache.enable = true;
      environment.systemPackages = with pkgs; [
        # niri
        xwayland-satellite
      ];
      services = {
        power-profiles-daemon.enable = true;
        upower.enable = true;
      };

    };
}
