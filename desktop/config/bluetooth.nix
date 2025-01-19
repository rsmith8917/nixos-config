{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
        IdleTimeout = 0;
      };
    };
  };

  hardware.logitech.wireless.enable = true;

  # Prevent annoying timeout where bluetooth keyboad
  # and mouse disconnect
  boot.kernelModules = [ "btusb" ];
  environment.etc."modprobe.d/btusb.conf".text = ''
    options btusb enable_autosuspend=0
  '';
}
