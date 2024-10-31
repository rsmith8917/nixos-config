{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ./shared-config
    ];

  networking.hostName = "desktop";
  networking.extraHosts =
    ''
      192.168.1.247 omen
    '';

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  users.users.robert = {
    isNormalUser = true;
    description = "Robert Smith";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [ ];
  };

  services.getty.autologinUser = "robert";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    firefox
    steam
  ];
  environment.variables.EDITOR = "vim";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  # Desktop Environment
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = false;
  services.xserver.resolutions = [{ x = 3840; y = 2160; }];
  # services.displayManager.defaultSession = "gnome";
  # services.displayManager.autoLogin.enable = true;
  # services.displayManager.autoLogin.user = "robert";

  programs.steam.enable = true;
}
