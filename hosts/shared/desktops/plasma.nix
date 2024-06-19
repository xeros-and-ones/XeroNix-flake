{pkgs, ...}: {
  # Enable the KDE Plasma Desktop Environment.
  services = {
    xserver.desktopManager.plasma5.enable = true;
    displayManager.sddm.enable = true;
  };
  environment.systemPackages = [
    pkgs.libsForQt5.qtstyleplugin-kvantum
  ];
}
