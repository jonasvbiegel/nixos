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
          command = "${pkgs.feh}/bin/feh --bg-scale ~/flake/modules/wallpapers/wallpaper.jpg";
          always = true;
          notification = false;
        }
      ];
    };
  };

  programs.rofi = {
    enable = true;
  };

  # services.picom = {
  #   enable = true;
  #   fade = false;
  #   shadow = false;
  #   settings = {
  #     blur = {
  #       method = "dual_kawase";
  #       size = 10;
  #       deviation = 5.0;
  #       strength = 7;
  #     };
  #     backend = "glx";
  #   };
  # };
}
