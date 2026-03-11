{
  flake.modules.nixos.overlays =
    {
      inputs,
      ...
    }:
    {
      nixpkgs.overlays = [
        (final: prev: {
          fflogs =
            (import inputs.nixpkgs-fflogs {
              inherit (prev) system;
              config.allowUnfree = true;
            }).fflogs;
        })
      ];
    };
}
