{
  lib,
  ...
}:

with lib;

{
  services.upower.enable = true;

  powerManagement = {
    enable = true;
    powertop.enable = true;
  };
}
