{ ... }:

{
  imports = [
    ./colorschemes/catppuccin.nix
    ./telescope.nix
    ./lualine.nix
    ./bufferline.nix
    ./neo-tree.nix
    ./which-key.nix
    ./lsp.nix
    ./cmp.nix
    ./conform.nix
    ./lazygit.nix
    ./keymaps.nix
    ./settings.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
  };
}
