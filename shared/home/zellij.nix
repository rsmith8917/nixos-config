# Zellij Terminal Multiplexer

{ pkgs, ... }:

{
  home.packages = with pkgs; [ zellij ];
  home.file = {
    ".config/zellij/layouts".source = ./zellij-layouts;
  };
  programs.zellij = {
    enable = true;
    settings = {
      theme = "carbon";
      themes = {
        carbon = {
          fg = "#dcdee3";
          bg = "#161616";
          black = "#282828";
          red = "#EE5396";
          green = "#78A9FF";
          yellow = "#08BDBA";
          blue = "#25be6a";
          magenta = "#BE95FF";
          cyan = "#33B1FF";
          white = "#dfdfe0";
          orange = "#3DDBD9";
        };
      };
      pane_frames = false;
      layout_dir = "/home/robert/.config/zellij/layouts";
      default_layout = "minimal";
      keybinds = {
        normal = {
          "bind \"Alt h\" \"Alt Left\"" = {
            MoveFocusOrTab = "Left";
          };
          "bind \"Alt l\" \"Alt Right\"" = {
            MoveFocusOrTab = "Right";
          };
        };
      };
    };
  };
}
