{ ... }:
{
  programs.nixvim.plugins.lualine = {
    enable = true;
    globalstatus = true;
    extensions = [
      "fzf"
      "neo-tree"
    ];
    disabledFiletypes = {
      statusline = [ "startup" "alpha" ];
    };
    theme = "auto";
  };
}
