{
  pkgs,
  lib,
  ...
}:

with pkgs;
with lib;

{
  persist.user.dirs = [
    ".local/share/PrismLauncher"
    ".config/ferium"
    ".minecraft"
  ];

  hm.home.packages = [
    (prismlauncher.override {
      gamemodeSupport = true;
      controllerSupport = true;
      textToSpeechSupport = false;

      jdks = builtins.attrValues {
        inherit
          temurin-jre-bin-23
          temurin-jre-bin # 21
          temurin-jre-bin-17
          temurin-jre-bin-8
          ;
      };
    })

    (portablemc.override {
      jre = temurin-jre-bin;
    })
  ];
}
