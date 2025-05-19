{
  inputs,
  pkgs,
  lib,
  ...
}:

with pkgs;

{
  persist.user.dirs = [ ".local/share/umu" ];

  environment.shellAliases.uwu = "umu-run";

  hm = {
    home.packages = [
      (umu-launcher.override {
        extraEnv = {
          SDL_VIDEODRIVER = lib.mkForce "";

          WINEPREFIX = lib.paths.winePrefix;

          PROTONPATH = toString proton-ge-bin.steamcompattool;

          STORE = toString inputs.umu-database;
        };
      })
    ];

    xdg.configFile."protonfixes" = {
      recursive = true;

      source = inputs.protonfixes;
    };
  };
}
