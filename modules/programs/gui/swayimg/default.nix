{
  config,
  ...
}:

{
  hm.programs.swayimg = {
    enable = true;

    settings = import ./settings.nix {
      inherit
        config
        ;
    };
  };
}
