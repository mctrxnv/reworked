{
  pkgs,
  ...
}:

{
  hm.home.packages = builtins.attrValues {
    inherit (pkgs)
      cachix
      hut
      nix-tree
      nurl
      ;
  };
}
