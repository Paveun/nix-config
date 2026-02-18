{
  flake.modules.homeManager.wofi =
    { pkgs, ... }:
    {
      programs.wofi = {
        enable = true;

        # style = ''
        #   * {
        #       font-family: monospace;
        #   }
        # '';
      };
    };
}
