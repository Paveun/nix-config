{
  flake.modules.homeManager.librepods =
    {
      inputs,
      pkgs,
      ...
    }:
    let
      librepods = inputs.librepods.packages.${pkgs.stdenv.hostPlatform.system}.default;
    in
    {
      home.packages = [ librepods ];

      xdg.desktopEntries.librepods = {
        name = "LibrePods";
        comment = "AirPods liberated from Apple's ecosystem";
        exec = "${librepods}/bin/librepods";
        icon = "${inputs.librepods}/linux-rust/assets/icon.png";
        terminal = false;
        type = "Application";
        categories = [
          "Utility"
          "Audio"
        ];
      };
    };
}
