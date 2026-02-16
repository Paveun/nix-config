{ config, ... }:
{
  nixosHosts.razer = {
    unstable = true;
    primaryUser = "paveun";

    modules = [
      ./_nixos
    ]
    ++ (with config.flake.modules.nixos; [
      desktop
      dev
      nvidia
    ]);

    homeManagerModules = [
      ./_home.nix
    ]
    ++ (with config.flake.modules.homeManager; [
      desktop
    ]);
  };
}
