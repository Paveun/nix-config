{
  flake.modules.homeManager.catppuccin =
    { inputs, ... }:
    {
      imports = [
        inputs.catppuccin.homeModules.catppuccin
      ];
      catppuccin = {
        enable = true;
        flavor = "mocha";
        firefox.enable = false;
        ghostty.enable = false;
        hyprlock.enable = false;
      };
    };
}
