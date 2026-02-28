{
  flake.modules.homeManager.librepods =
    {
      inputs,
      pkgs,
      ...
    }:
    {
      home.packages = [
        inputs.librepods.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
