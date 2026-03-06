{ config, ... }:
{
  nixosHosts.aion = {
    unstable = true;

    modules = [
      ./_nixos
    ]
    ++ (with config.flake.modules.nixos; [
      desktop
      dev
      gaming
    ]);

    homeManagerModules = [
      ./_home
    ]
    ++ (with config.flake.modules.homeManager; [
      desktop
      gaming
    ]);
  };
}
