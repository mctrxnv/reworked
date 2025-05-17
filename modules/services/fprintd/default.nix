{
  pkgs,
  lib,
  ...
}:

with lib;

{
  services.fprintd = {
    enable = mkIf (itIs == "laptop") true;

    package = pkgs.stable.fprintd-tod;

    tod = {
      enable = true;

      driver = pkgs.stable.libfprint-2-tod1-vfs0090;
    };
  };
}
