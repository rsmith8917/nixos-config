{ pkgs, ... }:
{
  # Define an overlay that pins PostgreSQL to 16.4
  nixpkgs.overlays = [
    (self: super: {
      postgresql_16_4 = super.postgresql_16.overrideAttrs (old: {
        version = "16.4";
        src = super.fetchurl {
          url = "https://ftp.postgresql.org/pub/source/v16.4/postgresql-16.4.tar.bz2";
          sha256 = "0vvd73rzj0sl294v15bh8yslakqv412bxqzlkqxyjwxa8pb6c5wp";
        };
        doCheck = false;
      });
    })
  ];

  # Enable and configure PostgreSQL
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_16_4;

    # This script will run once during the first service start,
    # creating a user (role) and database, and assigning privileges.
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE postgres WITH LOGIN PASSWORD 'postgres' CREATEDB;
      CREATE DATABASE postgres;
      GRANT ALL PRIVILEGES ON DATABASE postgres TO postgres;
    '';

    ensureDatabases = [ "postgres" ];
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 10 ''
      #...
      #type database DBuser origin-address auth-method
      local all       all     trust
      # ipv4
      host  all      all     127.0.0.1/32   trust
      # ipv6
      host all       all     ::1/128        trust
    '';
  };

  # (Optional) If you would like PostgreSQL to listen on a particular interface or port:
  # services.postgresql.extraConfig = ''
  #   listen_addresses = '*'
  #   port = 5432
  # '';

  # Make sure to open up the PostgreSQL port if needed:
  # networking.firewall.allowedTCPPorts = [ 5432 ];
}
