{
  homeHosts.Daedalus = {
    unstable = true;
    system = "aarch64-darwin";
    modules = [
      {
        nix.settings.max-jobs = 8;
        programs.starship.settings.hostname.style = "bold purple";
      }
    ];
  };
}
