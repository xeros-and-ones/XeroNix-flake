{pkgs, ...}: {
  # Enable the KDE Plasma Desktop Environment.
  services.xserver = {
    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;
  };
  environment.systemPackages = [
    pkgs.libsForQt5.qtstyleplugin-kvantum
  ];
}
