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
        # package = pkgs.niri-unstable;
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

      xdg.portal.config.niri = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.Access" = [ "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
        "org.freedesktop.impl.portal.Notification" = [ "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
      };

    };
}
