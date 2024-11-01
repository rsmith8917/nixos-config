{ ... }:

{
  home.username = "robert";
  home.homeDirectory = "/home/robert";

  imports = [ ../shared/home ];

  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
