# GIT Source Code Control

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "rsmith8917";
    userEmail = "rsmith8917@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
