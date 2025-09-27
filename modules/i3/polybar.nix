{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [pkgs.nerd-fonts.fira-mono];

  services.polybar = {
    # this makes pulseaudio work
    package = pkgs.polybar.override {pulseSupport = true;};
    enable = true;
    script = "polybar polybar &";
    settings = {
      "bar/polybar" = {
        monitor = "eDP-1";
        width = "100%";
        height = "3%";

        background = "#AA000000";

        module-margin = 1;

        padding-right = 1;

        separator = "|";

        font-0 = "FiraMono Nerd Font:size=16;2";
        font-1 = "FiraMono Nerd Font:size=40:weight=bold;2";
        font-2 = "FiraMono Nerd Font:size=40:weight=bold;2";

        modules-left = "xworkspaces";
        modules-center = "time";
        modules-right = "systray pulseaudio wireless-network battery";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:60:...%";
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";

        label-active = "%name%";
        label-active-foreground = "#FFFFFFFF";
        label-active-padding = 1;

        label-occupied = "%name%";
        label-occupied-foreground = "#FF888888";
        label-occupied-font = "#FF888888";
        label-occupied-padding = 1;

        label-empty = "%name%";
        label-empty-foreground = "#FF888888";
        label-empty-padding = 1;
        label-empty-font = 1;
      };

      "module/systray" = {
        type = "internal/tray";

        format-margin = "8pt";
        tray-spacing = "16pt";
        tray-size = "66%";
      };

      "module/time" = {
        type = "internal/date";
        interval = 1;

        date = "%H:%M";

        label = "%date%";
        label-padding = "13pt";
      };

      "module/battery" = {
        type = "internal/battery";

        battery = "BAT1";
        adapter = "ACAD";

        low-at = 10;

        label-charging = "bat %percentage%%";
        label-charging-spacing = 2;
        label-discharging = "bat %percentage%%";
        label-discharging-spacing = 2;
      };

      "module/wireless-network" = {
        type = "internal/network";
        interface = "wlp1s0";

        format-connected = "wifi <label-connected>";
        format-disconnected = "wifi <label-disconnected>";

        label-connected = "%essid%";
        label-disconnected = "disconnected";
      };

      "module/pulseaudio" = {
        type = "internal/pulseaudio";

        sink = "alsa_output.pci-0000_c1_00.6.analog-stereo";

        format-volume = "<label-volume>";
        format-muted = "<label-muted>";

        label-volume = "vol %percentage%%";

        label-muted = "vol %percentage%%";
        label-muted-foreground = "#FF888888";
      };

      "settings" = {
        pseudo-transparency = true;
      };
    };
  };
}
