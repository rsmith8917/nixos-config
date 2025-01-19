{ ... }:
{
  programs.nixvim.plugins.avante = {
    enable = true;
    settings = {
      provider = "openai";
      claude = {
        endpoint = "https://api.openai.com";
        model = "get-4o-mini";
      };
      mappings = {
        diff = {
          ours = "co";
          theirs = "ct";
          none = "c0";
          both = "cb";
          next = "]x";
          prev = "[x";
        };
      };

      hints.enabled = true;
      windows = {
        wrap = true;
        width = 30;
        sidebar_header = {
          align = "center";
          rounded = true;
        };
      };
      highlights.diff = {
        current = "DiffText";
        incoming = "DiffAdd";
      };
      diff = {
        debug = false;
        autojump = true;
        list_opener = "copen";
      };
    };
  };
}
