{
  config,
  pkgs,
  lib,
  ...
}: {
  home.packages = [pkgs.nerd-fonts.caskaydia-mono];

  services.polybar = {
    enable = true;
    script = "polybar polybar &";
    settings = {
      "bar/polybar" = {
        monitor = "eDP-1";
        width = "100%";
        height = "4%";

        background = "#AA000000";

        # border-bottom-size = 2;
        # border-bottom-color = "#7aa2f7";

        font-0 = "CaskaydiaMono Nerd Font:size=16:weight=500;2";
        font-1 = "CaskaydiaMono Nerd Font:size=16:weight=100;2";
        font-2 = "CaskaydiaMono Nerd Font:size=16:weight=bold;2";

        modules-left = "xworkspaces systray";
        modules-center = "xwindow";
        modules-right = "time";
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:60:...%";
      };

      "module/xworkspaces" = {
        type = "internal/xworkspaces";

        label-active = "%name%";
        # label-active-background = "#00FFFFFF";
        label-active-foreground = "#FFFFFFFF";
        label-active-padding = 1;

        label-occupied = "%name%";
        # label-occupied-background = "#00000000";
        label-occupied-foreground = "#FF888888";
        label-occupied-font = "#FF888888";
        label-occupied-padding = 1;

        label-empty = "%name%";
        # label-empty-background = "#00000000";
        label-empty-foreground = "#FF888888";
        label-empty-padding = 1;
        label-empty-font = 2;
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
        label-padding = 2;

        format-prefix = "";
        format-prefix-font = 2;
      };

      "settings" = {
        pseudo-transparency = true;
      };
    };
  };
}
