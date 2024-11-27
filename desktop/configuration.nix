{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../shared/configuration
  ];

  networking.hostName = "desktop";
  networking.extraHosts = ''
    192.168.1.247 server
    192.168.1.59  nas
    192.168.1.60  node0
    192.168.1.61  node1
    192.168.1.62  node2
  '';

  users.users.robert = {
    isNormalUser = true;
    description = "Robert Smith";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
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

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "postgres" ];
    enableTCPIP = true;
    port = 5432;
    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      local all       all     trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres' CREATEDB;
      CREATE DATABASE postgres;
      GRANT ALL PRIVILEGES ON DATABASE postgres TO postgres;
    '';
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
