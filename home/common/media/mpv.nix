{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    scripts = with pkgs.mpvScripts; [mpris uosc thumbfast];
    config = {
      force-window = true;
      geometry = "100%x100%-+0-+0";
    };
    bindings = {
      "UP" = "add volume 5";
      "DOWN" = "add volume -5";
      "Ctrl+UP" = "add speed 0.1";
      "Ctrl+DOWN" = "add speed -0.1";
    };
  };
}
