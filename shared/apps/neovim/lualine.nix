{ ... }:
{
  programs.nixvim.plugins.lualine = {
    enable = true;
    settings = {
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
  };
}
