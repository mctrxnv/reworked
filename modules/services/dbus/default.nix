{
  lib,
  ...
}:

with lib;

{
  services = {
    dbus.implementation = "broker";

    udisks2 = {
      enable = true;

      mountOnMedia = true;
    };
  };
}
