{
  pkgs,
  ...
}:

{
  persist.dirs = [ "/var/lib/bluetooth" ];

  environment.systemPackages = with pkgs; [ bluetui ];

  hardware.bluetooth = {
    enable = true;

    powerOnBoot = true;

    settings = {
      General = {
        Experimental = true;
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
}
