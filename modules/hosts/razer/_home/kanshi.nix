{
  services.kanshi = {
    screens.laptop = {
      criteria = "eDP-1";
      mode = "1920x1080@143.998Hz";
      position = "0,0";
      scale = 1.0;
    };
    _profiles.desktop = {
      wifi = true;
      screens.laptop.status = "enable";
    };
  };
}
