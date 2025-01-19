{ ... }:

{
  imports = [
    ./colorschemes/nightfox.nix
    ./telescope.nix
    ./lualine.nix
    ./bufferline.nix
    ./bufdelete.nix
    ./neo-tree.nix
    ./which-key.nix
    ./lsp.nix
    ./cmp.nix
    ./conform.nix
    ./comment.nix
    ./lazygit.nix
    ./codeium.nix
    ./keymaps.nix
    ./settings.nix
    ./treesitter.nix
    ./illuminate.nix
    ./indent-blankline.nix
    ./fidget.nix
    ./web-devicons.nix
    ./lspkind.nix
    ./mini.nix
    ./scrollview.nix
    ./smart-splits.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
