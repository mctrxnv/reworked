{
  pkgs,
  lib,
  config,
  ...
}:

{
  hm = {
    programs.yazi =
      {
        enable = true;

        keymap = import ./binds.nix {
          inherit
            lib
            config
            ;
        };

        initLua = import ./lua.nix {
          inherit
            config
            ;
        };

        theme = import ./theme.nix {
          inherit
            lib
            config
            ;
        };
      }
      // import ./plugins.nix {
        inherit
          pkgs
          ;
      }
      // import ./settings/main.nix {
        inherit
          lib
          config
          ;
      };

    home.packages = with pkgs; [
      ffmpegthumbnailer
      wl-clipboard
      poppler_min
      glow
      ouch
      jq
    ];
  };
}
