{
  pkgs,
  lib,
  ...
}:

with lib;

{
  environment = {
    systemPackages = with pkgs; [
      fff
      killall
      vim
    ];

    variables = {
      EDITOR = "vim";
      VISUAL = "vim";
    };
  };

  programs = {
    adb.enable = true;

    light.enable = mkIf (itIs == "laptop") true;

    git.package = mkDefault pkgs.gitMinimal;
  };
}
