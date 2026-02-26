{
  flake.modules.nixos.noctalia =
    { pkgs, inputs, ... }:
    {
      environment.systemPackages = [
        inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
    };
}
