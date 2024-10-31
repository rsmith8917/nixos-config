# CLI Utilities

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gimp
    inkscape
    vlc
    zoom-us
  ];
}
