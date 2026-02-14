{
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 8d --keep 20";
    flake = "/home/paveun/nix-config"; # sets NH_OS_FLAKE variable for you
  };
}
