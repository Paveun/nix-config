{
  flake.modules.nixos.containers =
    {
      # inputs,
      pkgs,
      primaryUser,
      ...
    }:
    {
      virtualisation = {
        docker = {
          enable = false;
          # rootless = {
          #   enable = true;
          #   setSocketVariable = true;
          # };
        };
        podman = {
          enable = true;
          dockerCompat = true;
          defaultNetwork.settings.dns_enabled = true; # Required for containers under podman-compose to be able to talk to each other.
        };
      };
      users.users.${primaryUser}.extraGroups = [
        # "docker"
        "podman"
      ];
      environment.systemPackages = with pkgs; [
        #   inputs.compose2nix.packages.x86_64-linux.default
        podman-compose
        podman-tui
        dive
      ];
    };
}
