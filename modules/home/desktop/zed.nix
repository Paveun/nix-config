{
  flake.modules.homeManager.zed-editor =
    { pkgs, lib, ... }:
    {
      programs.zed-editor = {
        enable = true;
        extensions = [
          "nix"
          "toml"
          "rust"
        ];
        userSettings = {
          # theme = {
          #   mode = "system";
          #   dark = "One Dark";
          #   light = "One Light";
          # };
          # hour_format = "hour12";
          edit_predictions = {
            provider = "copilot";
          };
          buffer_font_weight = 300.0;
          # buffer_font_size = 13.0;
          # buffer_font_family = "JetBrainsMono Nerd Font";
          # vim_mode = true;
          terminal = {
            font_family = "JetBrainsMono Nerd Font";
            font_size = 13.0;
            shell.program = lib.getExe pkgs.fish;
          };
        };
      };
      home.packages = with pkgs; [
        nil
        nixd
      ];
    };
}
