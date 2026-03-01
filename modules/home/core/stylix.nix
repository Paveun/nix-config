{
  flake.modules.homeManager.stylix =
    { pkgs, inputs, ... }:
    {
      imports = [ inputs.stylix.homeModules.stylix ];
      stylix = {
        enable = true;
        base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
        polarity = "dark";

        fonts = {
          sizes = {
            applications = 11;
            desktop = 11;
            popups = 10;
            terminal = 11;
          };
          monospace = {
            name = "JetBrainsMono Nerd Font";
            package = pkgs.nerd-fonts.jetbrains-mono;
          };
          serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
          };
          sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
          };
          emoji = {
            package = pkgs.noto-fonts-color-emoji;
            name = "Noto Color Emoji";
          };
        };
        cursor = {
          name = "Bibata-Modern-Classic";
          package = pkgs.bibata-cursors;
          size = 24;
        };
        icons = {
          enable = true;
          package = pkgs.papirus-icon-theme;
          light = "Papirus-Dark";
          dark = "Papirus-Dark";
        };
        targets = {
          # ghostty.enable = false;
          firefox.enable = false;
          hyprlock.enable = false;
          nixvim.enable = false;
          zed.fonts.override.sizes.terminal = 10;
          # noctalia-shell.enable = false;
        };
      };
    };
}
