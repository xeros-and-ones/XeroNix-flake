# This file defines overlays
{inputs, ...}: let
  chrome-125-src = import (fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/67b4bf1df4ae54d6866d78ccbd1ac7e8a8db8b73.tar.gz";
    sha256 = "07gzgcgaclgand7j99w45r07gc464b5jbpaa3wmv6nzwzdb3v3q4";
  });
in {
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs {pkgs = final;};

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    myChrome = chrome-125-src.google-chrome;
  };
}
