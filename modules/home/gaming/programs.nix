{
  flake.modules.homeManager.gaming =
    {
      pkgs,
      inputs,
      ...
    }:
    {
    home.packages = with pkgs; [
      inputs.hytale-launcher.packages.${pkgs.stdenv.hostPlatform.system}.default
      fflogs
      xivlauncher
      prismlauncher
    ];
  };
}
