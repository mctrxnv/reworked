{
  pcRyazenka = {
    system = {
      itIs = "desktop";
      hostName = "jetpure";
      userName = "nixzoid";
      platform = "x86_64-linux";
      version = "24.05";
    };
    paths = {
      flakeDir = "/persist/flake";
      passwords = "/persist/passwords/passwords.kdbx";
      winePrefix = "/media/disks/fastBitch/SteamUnified";
      persist = null;
    };
    style = {
      theme = "horizonDark";
      image = "hanabiFireworks";
    };
  };

  # thinkpadT14 = {
  #   sys = {
  #     hostName = "embrace";
  #     userName = "huggyer";
  #     is = "laptop";
  #     platform = "x86_64-linux";
  #     ver = "24.05";
  #   };
  #   path = {
  #     flake = "/persist/flake";
  #     pass = "/persist/vault/passwords.kdbx";
  #     steamUnified = "/persist/proton-prefix";
  #     impermanence = "/persist";
  #   };
  #   styl = {
  #     theme = "neoGenesis";
  #     image = "townChristmas";
  #   };
  # };

  # isoNixtended = {
  #   sys = {
  #     hostName = "sus";
  #     userName = "amogus";
  #     is = "iso";
  #     platform = "x86_64-linux";
  #     ver = "24.05";
  #   };
  #   styl = {
  #     theme = "horizon-dark";
  #     image = "town";
  #   };
  # };
}
