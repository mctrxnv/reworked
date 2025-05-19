{
  pkgs,
  lib,
  ...
}:

with lib;

mkIf (itIs != "desktop" || itIs == "laptop") {
  persist.user.dirs = [ ".srb2" ];

  hm.home.packages = with pkgs; [ srb2 ];
}
