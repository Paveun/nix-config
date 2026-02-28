{
  flake.modules.nixos.amdgpu = {
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
