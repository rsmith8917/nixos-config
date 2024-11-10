# CLI Utilities

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    deluge
    handbrake
  ];
}
