{ ... }:

{
  home.username = "robert";
  home.homeDirectory = "/home/robert";

  imports = [
    ../shared/home
    ./apps.nix
  ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
