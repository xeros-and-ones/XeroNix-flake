{
  virtualisation.libvirtd = {
    enable = true;
    spiceUSBRedirection.enable = true;
    qemu = {
      runAsRoot = true;
      swtpm.enable = true;
    };
  };
  programs.virt-manager.enable = true;
}
