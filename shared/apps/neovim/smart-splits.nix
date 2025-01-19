{ ... }:
{
  programs.nixvim = {
    plugins.smart-splits = {
      enable = true;
      settings = {
        ignored_filetypes = [
          "neo-tree"
        ];
      };
    };
  };
}
