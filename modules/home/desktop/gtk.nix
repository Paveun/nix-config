{
  flake.modules.homeManager.gtk =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    let
      cursorTheme = {
        name = "Numix-Cursor-Light";
        package = pkgs.numix-cursor-theme;
      };
    in
    {
      home.pointerCursor = {
        gtk.enable = true;
        enable = true;
        inherit (cursorTheme)
          name
          package
          ;
      };

      # Prevents GTK from saving "recently accessed files"
      xdg.dataFile."recently-used.xbel" = {
        force = true;
        text = "";
      };

      gtk = {
        enable = true;

        font = {
          name = "DejaVu Sans";
          size = 11;
        };

        theme = {
          name = "rose-pine-gtk";
          package = pkgs.rose-pine-gtk-theme;
        };

        # iconTheme = {
        #   name = "Papirus-Dark";
        #   package = pkgs.papirus-icon-theme;
        # };

        inherit cursorTheme;

        gtk3.bookmarks = [
          "file://${config.xdg.userDirs.download}"
          "file://${config.home.homeDirectory}/temp"
          "file:///mnt"
          "file:///mnt/server"
          "file:///mnt/server/gaetan/photos/1_grimpe"
        ];

        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      };
    };
}
