{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

with lib;

{
  stylix = {
    enable = true;
    overlays.enable = true;

    autoEnable = false;

    image = import ./image.nix {
      inherit
        inputs
        pkgs
        lib
        config
        ;
    };

    base16Scheme = inputs.base16."${style.theme}";

    cursor = {
      size = 24;
      name = "GoogleDot-Custom";
      package =
        let
          mk = a: b: c: {
            background_color = a;
            outline_color = b;
            accent_color = c;
          };
        in
        inputs.cursors.packages.${pkgs.system}.google-cursor.override (
          with config.lib.stylix.colors.withHashtag;
          if (itIs == "laptop") then
            mk base08 base00 base08
          else if (itIs == "desktop") then
            mk base0E base00 base0E
          else
            mk base00 base05 base05
        );
    };

    fonts =
      rec {
        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };

        monospace = {
          package = pkgs.nerd-fonts.caskaydia-cove;
          name = "CaskaydiaCove Nerd Font";
        };

        sansSerif = monospace;

        serif = monospace;
      }
      // {
        sizes = {
          desktop = 10;
          popups = 10;
          applications = 12;
          terminal = 12;
        };
      };

    targets = {
      console.enable = true;
      chromium.enable = true;
      fish.enable = true;

      plymouth = {
        enable = true;

        logoAnimated = true;
      };
    };
  };

  environment.systemPackages =
    with pkgs;
    [
      corefonts
      liberation_ttf
      arkpandora_ttf
    ]
    ++ (with nerd-fonts; [ tinos ]);
}
