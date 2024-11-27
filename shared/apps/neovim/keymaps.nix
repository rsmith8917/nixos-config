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
      {
        mode = "n";
        key = "<A-j>";
        action = "<cmd>execute 'move .+' . v:count1<cr>==";
      }
      {
        mode = "n";
        key = "<A-k>";
        action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
      }
    ];
  };
}
