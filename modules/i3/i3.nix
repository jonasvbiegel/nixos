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
        inner = 5;
        outer = 3;
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
          command = "${pkgs.feh}/bin/feh --bg-scale ~/flake/modules/i3/wallpapers/tokyonight.png";
          always = true;
          notification = false;
        }
      ];
      colors = {
        focused = {
          background = "#0076ad";
          border = "#0076ad";
          childBorder = "#0076ad";
          indicator = "#0076ad";
          text = "#0076ad";
        };

        focusedInactive = {
          background = "#00364f";
          border = "#00364f";
          childBorder = "#00364f";
          indicator = "#00364f";
          text = "#00364f";
        };

        unfocused = {
          background = "#00364f";
          border = "#00364f";
          childBorder = "#00364f";
          indicator = "#00364f";
          text = "#00364f";
        };
      };
    };
  };

  programs.rofi = {
    enable = true;
    theme = "~/flake/modules/i3/rounded-gray-dark.rasi/";
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
