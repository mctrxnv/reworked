{
  pkgs,
  ...
}:

with pkgs;

{
  hm.home.packages = [
    imagemagick
    jpegoptim
    optipng
    lutgen
  ];
}
