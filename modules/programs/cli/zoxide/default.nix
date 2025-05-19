{
  persist.user.dirs = [ ".local/share/zoxide" ];

  hm.programs.zoxide = {
    enable = true;

    enableFishIntegration = true;
    enableZshIntegration = true;

    options = [ "--cmd cd" ];
  };
}
