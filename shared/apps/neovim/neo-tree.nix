{ ... }:
{
  programs.nixvim = {
    plugins.neo-tree = {
      enable = true;
      sources = [
        "filesystem"
        "buffers"
        "git_status"
        "document_symbols"
      ];
      addBlankLineAtTop = false;
      filesystem = {
        bindToCwd = false;
        followCurrentFile = {
          enabled = true;
        };
        filteredItems = {
          hideDotfiles = false;
          hideGitignored = false;
          hideHidden = false;
        };
      };

      defaultComponentConfigs = {
        indent = {
          withExpanders = true;
          expanderCollapsed = "󰅂";
          expanderExpanded = "󰅀";
          expanderHighlight = "NeoTreeExpander";
        };

        gitStatus = {
          symbols = {
            added = " ";
            conflict = "󰩌 ";
            deleted = "󱂥";
            ignored = " ";
            modified = " ";
            renamed = "󰑕";
            staged = "󰩍";
            unstaged = "";
            untracked = " ";
          };
        };
      };

      window = {
        position = "left";
      };
    };
    keymaps = [
      {
        mode = [ "n" ];
        key = "<leader>e";
        action = "<cmd>Neotree toggle reveal<cr>";
        options = {
          desc = "Open/Close Neotree";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>tf";
        action = "<cmd>Neotree source=filesystem focus reveal<cr>";
        options = {
          desc = "Open/Focus Neotree filesystem";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>tb";
        action = "<cmd>Neotree source=buffers focus reveal<cr>";
        options = {
          desc = "Open/Focus Neotree buffers";
        };
      }
      {
        mode = [ "n" ];
        key = "<leader>tg";
        action = "<cmd>Neotree source=git_status focus reveal<cr>";
        options = {
          desc = "Open/Focus Neotree GIT status";
        };
      }
    ];
  };
}
