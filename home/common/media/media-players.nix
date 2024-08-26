{pkgs, ...}: {
  home.packages = with pkgs; [haruna mpc-qt];
}
