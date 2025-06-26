{
  config,
  pkgs,
  lib,
  ...
}: {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      bars = [];
      gaps = {
        inner = 5;
        outer = 5;
        smartBorders = "on";
      };
      defaultWorkspace = "workspace number 1";
      window = {
        titlebar = false;
        border = 1;
      };
      startup = [
        {
          command = "systemctl --user restart polybar";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ./wallpapers/wall1.jpg";
          always = true;
          notification = false;
        }
      ];
    };
  };
}
