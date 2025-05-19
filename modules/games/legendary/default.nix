{
  pkgs,
  lib,
  ...
}:

{
  hm = {
    home.packages = with pkgs; [ legendary-gl ];

    xdg.configFile."legendary/config.ini".text = lib.generators.toINI { } {
      "Legendary" = {
        disable_auto_aliasing = false;
        disable_https = false;
        disable_update_check = false;
        disable_update_notice = false;
        install_dir = "/media/disks/fastBitch/Games";
        locale = "en-US";
        log_level = "debug";
        max_memory = 2048;
        max_workers = 8;
      };
    };
  };
}
