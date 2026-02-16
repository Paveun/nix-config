{
  flake.modules.nixos.users =
    { primaryUser, ... }:
    {
      users = {
        mutableUsers = true;

        users = {
          root = {
            isSystemUser = true;
          };

          ${primaryUser} = {
            isNormalUser = true;
            uid = 1000;

            group = primaryUser;

            extraGroups = [
              # Enable ‘sudo’ for the user.
              "wheel"

              # Enable user to add and edit network connections
              "networkmanager"
            ];

          };
        };

        groups = {
          ${primaryUser}.gid = 1000;
        };
      };
    };
}
