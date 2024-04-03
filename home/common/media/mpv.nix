{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvSscripts; [mpris uosc thumbfast];
  };
}
