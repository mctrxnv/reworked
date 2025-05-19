{
  lib,
  config,
  ...
}:

with lib;
let
  cfg = config.persist;
in

{
  options = {
    persist = with types; {
      dirs = mkList.str [ ];
      files = mkList.str [ ];

      user = {
        dirs = mkList.str [ ];
        files = mkList.str [ ];
      };
    };
  };

  config = mkIf (lib.paths.persist != null) {
    boot.initrd = import ./initrd.nix {
      inherit
        lib
        ;
    };

    fileSystems.${lib.paths.persist}.neededForBoot = true;

    environment.persistence.${lib.paths.persist + "/system"} = {
      hideMounts = true;

      directories = [
        "/var/log"
        "/var/lib/nixos"
        "/var/lib/systemd/coredump"
        "/var/lib/systemd/timers"
        {
          directory = "/var/lib/colord";
          user = "colord";
          group = "colord";
          mode = "u=rwx,g=rx,o=";
        }
      ] ++ cfg.dirs;

      files = [
        "/etc/machine-id"
      ] ++ cfg.files;

      users.${x.sys.userName} = {
        directories = [ ] ++ cfg.user.dirs;

        files = [ ] ++ cfg.user.files;
      };
    };
  };
}
