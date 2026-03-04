{
  flake.modules.homeManager.vesktop = {
    programs.vesktop = {
      enable = true;
      settings = {
        hardwareAcceleration = true;
        arRPC = true;
        checkUpdates = false;
        customTitleBar = false;
        disableMinSize = true;
        minimizeToTray = false;
        discordBranch = "stable";
      };
    };
  };
}
