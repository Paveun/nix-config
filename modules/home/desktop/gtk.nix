{
  flake.modules.homeManager.gtk =
    {
      pkgs,
      lib,
      config,
      ...
    }:
    # let
    #   cursorTheme = {
    #     name = "Bibata-Modern-Classic";
    #     package = pkgs.bibata-cursors;
    #     size = 24;
    #   };
    # in
    {
      # dconf.settings = {
      #   "org/gnome/desktop/interface" = {
      #     color-scheme = "prefer-dark";
      #   };
      # };
      # home.pointerCursor = {
      #   gtk.enable = true;
      #   enable = true;
      #   inherit (cursorTheme)
      #     name
      #     package
      #     size
      #     ;
      # };

      # Prevents GTK from saving "recently accessed files"
      xdg.dataFile."recently-used.xbel" = {
        force = true;
        text = "";
      };

      gtk = {
        enable = true;

        # font = {
        #   name = "DejaVu Sans";
        #   size = 11;
        # };

        # theme = {
        #   name = "rose-pine";
        #   package = pkgs.rose-pine-gtk-theme;
        # };

        # iconTheme = {
        #   name = "Papirus-Dark";
        #   package = pkgs.papirus-icon-theme;
        # };

        # inherit cursorTheme;

        gtk3.bookmarks = [
          "file://${config.xdg.userDirs.download}"
          "file://${config.home.homeDirectory}/temp"
        ];

        gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
      };
    };
}
