{
  lib,
  config,
  ...
}:

with lib;

mkIf (itIs != "desktop" || itIs != "laptop") {
  hm.programs.foot = {
    enable = true;

    settings = {
      main = {
        pad = "10x10 center";
        resize-by-cells = "yes";
        letter-spacing = 0;
      };

      cursor = with config.lib.stylix.colors; {
        style = "block";
        color = "${base00} ${base06}";
      };

      mouse.hide-when-typing = "yes";
    };
  };
}
