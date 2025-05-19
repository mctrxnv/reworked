{
  pkgs,
  ...
}:

with pkgs;

{
  hm.home.packages = [
    zip
    unzip
    unrar
  ];
}
