# VSCode IDE

{ pkgs, ... }:

{
  home.packages = with pkgs; [ vscode ];

  programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode-remote.remote-ssh
      ms-vscode-remote.remote-containers
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      esbenp.prettier-vscode
      ms-vscode.cpptools
      rust-lang.rust-analyzer
      github.github-vscode-theme
      enkia.tokyo-night
    ];

    userSettings = {
      "workbench.startupEditor" = "none";
      "workbench.activityBar.location" = "top";
      "workbench.sideBar.location" = "right";
      "workbench.layoutControl.enabled" = false;
      "workbench.editor.enablePreview" = false;
      "window.titleBarStyle" = "custom";
      "window.commandCenter" = false;
      "extensions.ignoreRecommendations" = true;
      "editor.minimap.enabled" = false;
      "editor.formatOnSave" = true;
      "editor.stickyScroll.enabled" = false;
      "git.enableSmartCommit" = true;
      "git.confirmSync" = false;
      "git.autofetch" = true;
      "explorer.confirmDragAndDrop" = false;
      "explorer.confirmDelete" = false;
      "workbench.colorTheme" = "Tokyo Night";
      "editor.fontFamily" = "'FiraCode Nerd Font Mono', 'Droid Sans Mono', 'monospace', monospace";
    };
  };
}
