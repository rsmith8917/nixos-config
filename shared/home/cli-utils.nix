# CLI Utilities

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vim
    neofetch
    zip
    xz
    unzip
    p7zip
    jq
    yq
    nmap
    which
    tree
    btop
    iotop
    iftop
    strace
    ltrace
    lsof
    wget
    nixpkgs-fmt
    nixfmt-rfc-style
    prettierd
  ];
}
