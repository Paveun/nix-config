{
  flake.modules.homeManager.desktop-programs =
    { pkgs, inputs, ... }:
    {
      programs.nheko.enable = true;

      home.packages = with pkgs; [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        # IM
        # discord
        # signal-desktop

        # Office / productivity
        libreoffice-fresh

        # Misc
        losslesscut-bin
        spotify
        slack
        google-chrome
        gemini-cli
        antigravity-fhs
        localsend
      ];
    };
}
