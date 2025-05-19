{
  pkgs,
  ...
}:

with pkgs.obs-studio-plugins;

{
  hm.programs.obs-studio = {
    enable = true;

    plugins = [
      obs-pipewire-audio-capture
      obs-multi-rtmp
      obs-vkcapture
      input-overlay
      wlrobs
    ];
  };
}
