{ pkgs, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/configuration
    ./config
  ];

  networking.hostName = "desktop";
  networking.extraHosts = ''
    192.168.1.247 server
    192.168.1.59  nas
    192.168.1.60  node0
    192.168.1.61  node1
    192.168.1.62  node2
    192.168.1.254 dell
  '';

  users.users.robert = {
    isNormalUser = true;
    description = "Robert Smith";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "audio"
    ];
    packages = with pkgs; [ ];
  };

  services.getty.autologinUser = "robert";

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    kubectl
    firefox
    steam
  ];
  environment.variables.EDITOR = "vim";

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.printing = {
    enable = true;
    drivers = [
      pkgs.gutenprint
      pkgs.gutenprintBin
      pkgs.hplip
      pkgs.hplipWithPlugin
      pkgs.brlaser
      pkgs.cnijfilter2
    ];
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

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
  hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;
  # Desktop Environment
  services.xserver = {
    enable = true;
    videoDrivers = [ "nvidia" ];
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    displayManager.gdm.wayland = false;
    resolutions = [
      {
        x = 3840;
        y = 2160;
      }
    ];
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  programs.steam.enable = true;

  virtualisation.docker = {
    enable = true;
  };
}
