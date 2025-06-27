{
  config,
  pkgs,
  lib,
  ...
}: let
  modifier = "Mod4";
in {
  xsession.windowManager.i3 = {
    enable = true;
    config = {
      modifier = "${modifier}";
      terminal = "kitty";
      bars = [];
      gaps = {
        inner = 10;
        outer = 5;
        smartBorders = "on";
      };
      defaultWorkspace = "workspace number 1";
      window = {
        titlebar = false;
        border = 2;
      };
      keybindings = import ./i3-keybindings.nix "${modifier}";
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

  programs.rofi = {
    enable = true;
  };
}
