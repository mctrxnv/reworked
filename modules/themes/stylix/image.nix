{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

with config.lib.stylix.colors;

pkgs.runCommand "output.png" { } ''
  ${lib.getExe pkgs.lutgen} apply ${inputs.wallpapers."${lib.style.image}"} -o $out -- ${
    builtins.concatStringsSep " " [
      base00
      base01
      base02
      base03
      base04
      base05
      base06
      base07
      base08
      base09
      base0A
      base0B
      base0C
      base0D
      base0E
      base0F
    ]
  }
''
