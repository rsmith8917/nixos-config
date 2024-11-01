{ ... }:

{
  home.username = "robert";
  home.homeDirectory = "/home/robert";

  imports = [
    ../shared/home/cli-utils.nix
    ../shared/home/git.nix
    ../shared/home/zellij.nix
    ../shared/home/alacritty.nix
    ../shared/home/gui-utils.nix
    ../shared/home/vscode.nix
    ../shared/home/gnome.nix
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
