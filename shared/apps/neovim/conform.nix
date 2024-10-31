{ lib, pkgs, ... }:
{
  programs.nixvim.plugins.conform-nvim = {
    enable = true;
    formatOnSave = {
      lspFallback = true;
      timeoutMs = 200;
    };

    formatAfterSave = {
      lspFallback = true;
    };
    notifyOnError = true;
    formattersByFt = {
      html = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      css = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      javascript = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      typescript = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      javascriptreact = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      typescriptreact = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      nix = [ "nixfmt-rfc-style" ];
      markdown = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      yaml = [
        [
          "prettierd"
          "prettier"
        ]
      ];
      json = [ "jq" ];
    };

    formatters = {
      nixfmt-rfc-style = {
        command = "${lib.getExe pkgs.nixfmt-rfc-style}";
      };
      jq = {
        command = "${lib.getExe pkgs.jq}";
      };
      prettierd = {
        command = "${lib.getExe pkgs.prettierd}";
      };
    };
  };
}
