{
  lib,
  ...
}:

with lib;

mkIf true {
  hm.programs.keepassxc = {
    enable = true;

    settings = import ./settings.nix {
      inherit
        lib
        ;
    };
  };
}
