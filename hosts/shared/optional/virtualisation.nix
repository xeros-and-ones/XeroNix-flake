{
  virtualisation = {
    spiceUSBRedirection.enable = true;
    waydroid.enable = true;
    lxd.enable = true;
    libvirtd = {
      enable = true;
      qemu = {
        runAsRoot = true;
        swtpm.enable = true;
      };
    };
  };
  programs.virt-manager.enable = true;
}
