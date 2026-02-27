{
  flake.modules.homeManager.niri =
    {
      lib,
      pkgs,
      config,
      ...
    }:
    {
      programs.niri.settings = {
        spawn-at-startup = [
          { argv = [ "${lib.getExe pkgs.xwayland-satellite}" ]; }
          { argv = [ "${lib.getExe config.programs.noctalia-shell.package}" ]; }
          { argv = [ "${lib.getExe pkgs.kanshi}" ]; }
        ];
      };
    };
}
