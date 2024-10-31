{ config, pkgs, ... }:

{
  home.username = "robert";
  home.homeDirectory = "/home/robert";

  imports = [
    ./cli-utils.nix
    ./git.nix
    ./zellij.nix
    ./alacritty.nix

    # GUI
    ./gui-utils.nix
    ./vscode.nix
    ./gnome.nix
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
