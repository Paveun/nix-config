{
  services.kanshi = {
    screens.alienware = {
      criteria = "DP-1";
      mode = "3440x1440@174.963Hz";
      position = "0,0";
      scale = 1.0;
    };
    _profiles.desktop = {
      wifi = false;
      screens.alienware.status = "enable";
    };
  };
}
