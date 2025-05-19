{
  pkgs,
  lib,
  config,
  ...
}:

with lib;
let
  extraArgs = "-nochatui -nofriendsui -silent";

  steamUnified = (
    lib.optionalAttrs (paths.winePrefix != null) {
      STEAM_COMPAT_CLIENT_INSTALL_PATH = config.hm.home.homeDirectory + "/.steam";
      STEAM_COMPAT_DATA_PATH = paths.winePrefix;
    }
  );
in

{
  persist.user.dirs = [
    ".local/share/Steam"
    ".steam"
  ];

  hardware.xone.enable = true;

  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;

      remotePlay.openFirewall = true;

      extraCompatPackages = [
        (pkgs.proton-ge-bin.override {
          steamDisplayName = "Proton-GE-unstable";
        })
      ];

      package = pkgs.steam.override {
        inherit
          extraArgs
          ;

        extraEnv = {
          MANGOHUD = true;
          OBS_VKCAPTURE = true;
          RADV_TEX_ANISO = 16;
        } // steamUnified;

        extraLibraries =
          pkgs: with pkgs; [
            libxkbcommon
            mesa
            wayland
          ];
      };
    };

    gamescope.enable = true;

    gamemode = {
      enable = true;
      enableRenice = true;
    };
  };

  systemd.user.services.steam-autostart = {
    wantedBy = [ "graphical-session.target" ];

    serviceConfig = {
      ExecStart = ''${getExe pkgs.steam} ${extraArgs} %U'';
      Restart = "on-abort";
      RestartSec = "5s";
    };

    environment = { } // steamUnified;
  };
}
