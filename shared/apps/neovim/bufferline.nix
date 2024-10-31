{ ... }:
{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    alwaysShowBufferline = false;
    offsets = [
      {
        filetype = "neo-tree";
        text = "Neo-tree";
        highlight = "Directory";
        text_align = "left";
      }
    ];
  };
}
