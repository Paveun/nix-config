{ config, ... }:
{
  nixosHosts.razer = {
    unstable = true;

    modules = [
      ./_nixos
    ]
    ++ (with config.flake.modules.nixos; [
      desktop
      dev
      nvidia
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
