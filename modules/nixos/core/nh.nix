{
  flake.modules.nixos.nh = {
    programs.nh = {
      enable = true;

      clean = {
        enable = true;

        # dates = "05:00";
        extraArgs = "--keep 10 --keep-since 8d";
      };
    };
  };
}
