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
        border = 3;
      };
      keybindings = import ./i3-keybindings.nix "${modifier}";
      startup = [
        {
          command = "systemctl --user restart polybar";
          always = true;
          notification = false;
        }
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ~/flake/modules/wallpapers/wallpaper10.jpg";
          always = true;
          notification = false;
        }
      ];
      colors = {
        focused = {
          background = "#5c5c5c";
          border = "#5c5c5c";
          childBorder = "#5c5c5c";
          indicator = "#5c5c5c";
          text = "#5c5c5c";
        };
        unfocused = {
          background = "#292929";
          border = "#292929";
          childBorder = "#292929";
          indicator = "#292929";
          text = "#292929";
        };
      };
    };
  };

  programs.rofi = {
    enable = true;
    theme = "~/flake/modules/rounded-gray-dark.rasi/";
  };

  services.picom = {
    enable = true;
    fade = false;
    shadow = false;
    settings = {
      backend = "glx";
    };
  };
}
