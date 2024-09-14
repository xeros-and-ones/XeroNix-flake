{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  # You can import other NixOS modules here
  imports = [
    # outputs.nixosModules.example
    # inputs.hardware.nixosModules.common-cpu-amd

    # ./users.nix

    ./hardware-configuration.nix
    ./gpu.nix
    ./power.nix
    ../shared/core/bluetooth.nix

    ../shared/users/xero

    ../shared/core
    ../shared/desktops/plasma.nix

    ../shared/core/fonts.nix

    ../shared/optional/steam.nix
    ../shared/optional/virtualisation.nix
    ../shared/optional/droidcam.nix
  ];

  networking = {
    hostName = "xeroNix"; # Define your hostname.
    networkmanager.enable = true;
    # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Open ports in the firewall.
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;

    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "126.0.0.1,localhost,internal.domain";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services = {
    openssh = {
      enable = true;
      settings = {
        # Forbid root login through SSH.
        PermitRootLogin = "no";
        # Use keys only. Remove if you want to SSH using password (not recommended)
        PasswordAuthentication = false;
      };
    };
    emacs.enable = true;

    xserver = {
      enable = true;

      # Configure keymap in X11
      xkb = {
        layout = "us,ara";
        options = "grp:win_space_toggle";
      };
    };
  };

boot.kernelPackages = pkgs.linuxPackages_zen;

  services.fstrim.enable = true;
  fileSystems."/mnt/Data" = {
    device = "dev/disk/by-label/Data";
    fsType = "ntfs-3g";
  };

  system.stateVersion = "23.11";
}
