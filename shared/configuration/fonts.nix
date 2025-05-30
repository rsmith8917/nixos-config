{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      fira-code-nerdfont
      jetbrains-mono
    ];
    fontconfig = {
      defaultFonts = {
        monospace = [ "JetBrains Mono" ];
      };
    };
  };
}
