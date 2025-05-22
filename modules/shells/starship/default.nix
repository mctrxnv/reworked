{
  lib,
  config,
  ...
}:

with lib;

{
  hm.programs.starship = {
    enable = true;
    enableTransience = true;

    settings = import ./settings.nix {
      inherit
        lib
        ;
    };
  };
}
