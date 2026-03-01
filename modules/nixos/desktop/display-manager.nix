{
  flake.modules.nixos.display-manager =
    { pkgs, ... }:
    let
      themePackage = pkgs.elegant-sddm.override {
        themeConfig.General.background = pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath;
      };
      # cursorTheme = {
      #   name = "Bibata-Modern-Classic";
      #   package = pkgs.bibata-cursors;
      #   size = 24;
      # };
    in
    {
      # The theme should be in both sddm.extraPackages and environment.systemPackages.
      # https://wiki.nixos.org/wiki/SDDM_Themes
      services.displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
        theme = "Elegant";
        extraPackages = [
          themePackage
          # cursorTheme.package
        ];
        # settings = {
        #   Theme = {
        #     CursorTheme = cursorTheme.name;
        #     CursorSize = cursorTheme.size;
        #   };
        # };
      };
      environment.systemPackages = [
        themePackage
        # cursorTheme.package
      ];
      # services.displayManager.gdm.enable = true;
    };
}
