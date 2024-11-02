# Zellij Terminal Multiplexer

{ pkgs, ... }:

{
  home.packages = with pkgs; [ zellij ];

  programs.zellij = {
    enable = true;
    settings = {
      theme = "tokyo-night";
      themes = {
        tokyo-night = {
          fg = "#A9B1D6";
          bg = "#1A1B26";
          black = "#383E5A";
          red = "#F93357";
          green = "#9ECE6A";
          yellow = "#E0AF68";
          blue = "#7AA2F7";
          magenta = "#BB9AF7";
          cyan = "#2AC3DE";
          white = "#C0CAF5";
          orange = "#FF9E64";
        };
      };
      pane_frames = false;
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
