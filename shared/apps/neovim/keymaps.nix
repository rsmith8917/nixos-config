{ ... }:
{
  programs.nixvim = {
    globals.mapleader = " ";
    keymaps = [
      # Quit (space + qq)
      {
        mode = "n";
        key = "<leader>qq";
        action = "<cmd>qa!<cr>";
      }

      # Move line up and down (CTRL + j / CTRL + k)
      {
        mode = "n";
        key = "<C-j>";
        action = "<cmd>execute 'move .+' . v:count1<cr>==";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==";
      }
      {
        mode = "i";
        key = "<C-j>";
        action = "<esc><cmd>m .+1<cr>==gi";
      }
      {
        mode = "i";
        key = "<C-k>";
        action = "<esc><cmd>m .-2<cr>==gi";
      }
      {
        mode = "v";
        key = "<C-j>";
        action = ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv";
      }
      {
        mode = "v";
        key = "<C-k>";
        action = ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv";
      }

      # New File (space + nf)
      {
        mode = "n";
        key = "<leader>nf";
        action = "<cmd>enew<cr>";
      }
    ];
  };
}
