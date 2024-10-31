{ ... }:
{
  programs.nixvim.plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader><space>" = {
        action = "find_files";
        options = {
          desc = "Find project files";
        };
      };
      "<leader>fg" = {
        action = "git_files";
        options = {
          desc = "Find git files";
        };
      };
    };
  };
}
