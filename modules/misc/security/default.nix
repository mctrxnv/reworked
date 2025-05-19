{
  pkgs,
  lib,
  ...
}:

with lib;

{
  security = {
    sudo.enable = false;

    sudo-rs = {
      enable = true;

      execWheelOnly = true;
      wheelNeedsPassword = true;

      extraRules = [
        {
          users = [ system.userName ];

          groups = [ "wheel" ];

          commands = [
            {
              command = getExe pkgs.light;
              options = [ "NOPASSWD" ];
            }
            {
              command = getExe' pkgs.uutils-coreutils-noprefix "tee";
              options = [ "NOPASSWD" ];
            }
          ];
        }
      ];
    };
  };
}
