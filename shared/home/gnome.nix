# GNOME Desktop

{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnomeExtensions.dash-to-dock
  ];

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        gtk-theme = "adw-gtk3-dark";
        text-scaling-factor = 1.25;
        clock-format = "12h";
      };
      "org/gtk/settings/file-chooser" = {
        clock-format = "12h";
      };
      "org/gnome/desktop/background" = {
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-l.png";
        picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-d.png";
        primary-color = "#77767B";
      };
      "org/gnome/desktop/screensaver" = {
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/vnc-l.png";
        primary-color = "#77767B";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          dash-to-dock.extensionUuid
        ];
      };
      "org/gnome/shell/extensions/dash-to-dock" = {
        disable-overview-on-startup = true;
        transparency-mode = "FIXED";
        background-opacity = 0.8;
        custom-background-color = true;
        background-color = "rgb(0,0,0)";
        dock-fixed = false;
        custom-theme-shrink = true;
        running-indicator-style = "DOTS";
      };
      "org/gnome/settings-daemon/plugins/power" = {
        sleep-inactive-ac-type = "nothing";
        power-button-action = "nothing";
      };
    };
  };
}



