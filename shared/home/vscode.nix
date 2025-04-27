# VSCode IDE

{ pkgs, nixpkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    vscode
  ];

  nixpkgs.overlays = [ inputs.catppuccin-vsc.overlays.default ];

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      esbenp.prettier-vscode
      ms-vscode.cpptools
      rust-lang.rust-analyzer
      github.github-vscode-theme
      enkia.tokyo-night
      dracula-theme.theme-dracula
      zhuangtongfa.material-theme
      teabyii.ayu
      vscodevim.vim
      golang.go
      github.copilot
      github.copilot-chat
      ms-kubernetes-tools.vscode-kubernetes-tools
      redhat.vscode-yaml
      catppuccin.catppuccin-vsc
      jdinhlife.gruvbox
      ms-python.python
      hashicorp.terraform
    ];

    userSettings = {
      "workbench.startupEditor" = "none";
      "workbench.activityBar.location" = "top";
      "workbench.sideBar.location" = "left";
      "workbench.layoutControl.enabled" = false;
      "workbench.editor.enablePreview" = false;
      "window.titleBarStyle" = "custom";
      "window.commandCenter" = false;
      "extensions.ignoreRecommendations" = true;

      # 🧼 Editor cleanup
      "editor.minimap.enabled" = false;
      "editor.formatOnSave" = true;
      "editor.stickyScroll.enabled" = false;
      "editor.lineNumbers" = "relative";
      "editor.fontFamily" = "'JetBrains Mono', 'Droid Sans Mono', 'monospace', monospace";

      # 🎨 Theme
      "workbench.colorTheme" = "Tokyo Night";
      # Options:
      # "Tokyo Night"
      # "Tokyo Night Storm"
      # "Dracula"
      # "GitHub Dark"
      # "GitHub Dark Dimmed"
      # "GitHub Dark Default"
      # "GitHub Dark High Contrast"
      # "GitHub Light"
      # "GitHub Light High Contrast"
      # "Ayu Dark"
      # "Ayu Mirage"
      # "Catppuccin Mocha"
      # "Catppuccin Latte"
      # "Catppuccin Macchiato"
      # "Catppuccin Frappé"
      # "One Dark Pro"
      # "One Dark Pro Darker"
      # "One Dark Pro Flat"
      # "Monokai"
      # "Monokai Dimmed"
      # "Gruvbox Dark Soft"
      # "Gruvbox Dark Medium"
      # "Gruvbox Dark Hard"

      # ⛅ Status bar cleanup
      "workbench.statusBar.visible" = true; # Needed for vim ":" input
      "debug.showInStatusBar" = "never";
      "scm.alwaysShowRepositories" = false;
      "git.enabled" = true;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.openRepositoryInParentFolders" = "never";
      "git.showProgress" = false;
      "typescript.tsserver.experimental.enableProjectDiagnostics" = false;
      "npm.enableScriptExplorer" = false;
      "problems.showCurrentInStatus" = false;
      "telemetry.telemetryLevel" = "off";

      # ⏳ Optional: Reduce other UI noise
      "breadcrumbs.enabled" = false;
      "workbench.tips.enabled" = false;
      "workbench.enableExperiments" = false;

      # 🧠 Vim plugin
      "vim.incsearch" = true;
      "vim.useSystemClipboard" = true;
      "vim.hlsearch" = true;
      "vim.leader" = "<space>";
      "vim.statusBarColorControl" = false;
      "vim.handleKeys" = {
        "<C-a>" = false;
        "<C-f>" = false;
        "<C-b>" = false;
        "<C-c>" = false;
        "<C-`>" = false;
        "<C-i>" = false;
      };

      # 🛠️ Formatters and languages
      "[javascript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescript]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[javascriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "[typescriptreact]" = {
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
      };
      "go.formatTool" = "gofmt";
      "[go]" = {
        "editor.formatOnSave" = true;
      };
      "[go.mod]" = {
        "editor.formatOnSave" = true;
      };
      "[helm]" = {
        "editor.defaultFormatter" = "redhat.vscode-yaml";
      };
      "files.associations" = {
        "**/templates/*.yaml" = "helm";
      };
    };

  };
}
