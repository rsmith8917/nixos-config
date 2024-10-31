# Alacritty Terminal

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    alacritty
  ];

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 11;
        normal = {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
        italic = {
          family = "FiraCode Nerd Font Mono";
          style = "Regular";
        };
      };
    };
  };
}



