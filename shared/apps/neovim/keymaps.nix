{ ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>qa!<cr>";
      }
    ];
  };
}
