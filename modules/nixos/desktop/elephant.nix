{
  flake.modules.nixos.elephant = {
    services = {
      elephant = {
        enable = true;
      };
    };
  };
}
