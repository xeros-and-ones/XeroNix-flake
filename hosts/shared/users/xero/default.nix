{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.mutableUsers = false;
  users.users.xero = {
    isNormalUser = true;
    extraGroups =
      [
        "networkmanager"
        "wheel"
        "video"
        "audio"
      ]
      ++ ifTheyExist [
        "minecraft"
        "network"
        "wireshark"
        "i2c"
        "mysql"
        "docker"
        "podman"
        "git"
        "libvirtd"
        "deluge"
        "adbusers"
      ];

    description = "Mohamed Tarek";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJLEprH7a3/04c3OmbjeVKoNgU53osLc7jJ57u5v5Jik mohamed96tarek@hotmail.com"
    ];
    hashedPassword = "$6$S9E.U16oYnf1/y7I$O8INgOJgM6AyzHelL8yKMTCBkkt/TUQK.7E9dBTsc63iPFs6rvBuQMHs14TEuS5GkuzZ8dfWrOBUwUHTPmvoQ/";
    packages = [pkgs.home-manager];
  };

  home-manager.users.xero = import ../../../../home/xero/${config.networking.hostName}.nix;
}
