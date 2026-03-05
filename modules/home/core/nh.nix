{
  flake.modules.homeManager.nh =
    { nhSwitchCommand, ... }:
    {
      home.shellAliases = {
        u = nhSwitchCommand;
        # uu = "${nhSwitchCommand} --update";
      };

      programs.nh = {
        enable = true;

        flake = "github:Paveun/nix-config";

        clean = {
          enable = true;

          dates = "daily";
          extraArgs = "--keep 5 --keep-since 8d";
        };
      };
    };
}
