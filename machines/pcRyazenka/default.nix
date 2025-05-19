{
  pkgs,
  ...
}:

{
  hm.home.packages = builtins.attrValues {
    inherit (pkgs)
      ventoy
      popsicle
      anicliru
      lowfi
      ;
  };
}
