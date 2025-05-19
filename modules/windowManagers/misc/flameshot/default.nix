{
  pkgs,
  config,
  ...
}:

with config.lib.stylix.colors.withHashtag;

{
  hm.services.flameshot = {
    enable = false;

    package = pkgs.flameshot.override {
      enableWlrSupport = true;
      enableMonochromeIcon = true;
    };

    settings = {
      General = {
        saveAsFileExtension = ".jpg";
        useJpgForClipboard = true;

        uiColor = base00;
        contrastUiColor = base0E;
        drawColor = base0C;
      };
    };
  };
}
