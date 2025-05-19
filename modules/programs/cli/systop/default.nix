{
  pkgs,
  ...
}:

{
  hm = {
    home.packages = [ pkgs.nvtopPackages.amd ];

    programs.btop = {
      enable = true;

      settings = import ./settings.nix;
    };
  };
}
