{
  config,
  pkgs,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./modules/nvim/nvim.nix
    ./modules/i3/i3.nix
    ./modules/i3/polybar.nix
    ./modules/hyprland/hyprland.nix
  ];

  home = {
    username = "jonas";
    homeDirectory = "/home/jonas";

    pointerCursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      gtk.enable = true;
      x11.enable = true;
    };

    packages = with pkgs; [
      fastfetch
      lf
      discord
      maim
      xclip
      zip
      unzip
      feh
      bluetui
      pamixer
      mullvad
      brightnessctl
      steam
      teams-for-linux
      bolt-launcher
      runelite
      libnotify

      # dont know how to do this down in kitty, so its up here
      maple-mono.NF
    ];
  };

  wayland.windowManager.hyprland.enable = true;

  programs = {
    git = {
      enable = true;
      userName = "Jonas Vittrup Biegel";
      userEmail = "10519146@ucn.dk";
    };
    gh.enable = true;

    librewolf = {
      enable = true;
      settings = {
        "signons.rememberSignons" = true;
        "privary.clearOnShutdown.cookies" = false;
        "full-screen-api.ignore-widgets" = true;
      };
    };

    kitty = {
      enable = true;
      # themeFile = "tokyo_night_night";
      themeFile = "tokyo_night_moon";
      shellIntegration.enableZshIntegration = true;
      font = {
        # package = pkgs.nerd-fonts.fira-code;
        # name = "FiraCode Nerd Font Mono";
        name = "Liga SFMono Nerd Font";
        size = 18;
      };
      settings = {
        # background_opacity = "0.95";
        window_padding_width = 4;
        modify_font = "cell_height 1px";
        italic_font = "postscript_name=MapleMono-NF-Italic";
      };
      extraConfig = "
        modify_font underline_position 5
        modify_font underline_thickness 300%
      ";
    };

    zsh = {
      enable = true;
      shellAliases = {
        nxs = "sudo nixos-rebuild switch --flake ~/flake/.";
        nix-init = "nix flake init --template templates\#utils-generic && direnv allow";

        # git aliases
        gaa = "git add -A";
        gc = "git commit";
        gps = "git push";
        gf = "git fetch";
        gpl = "git pull";
        gch = "git checkout";
        gst = "git status";
        clone = "(kitty 2> /dev/null &)";
        spotify = "spotify_player";
      };
    };

    btop = {
      enable = true;
      extraConfig = "theme_background = false";
    };

    zathura = {
      enable = true;
      extraConfig = "
        set selection-clipboard clipboard
        set guioptions none

        # Tokyo Night color scheme for Zathura.
        # Original color scheme: https://github.com/enkia/tokyo-night-vscode-theme
        # Provided for Zathura by https://github.com/CondensedMilk7
        # Copy these lines into your ~/.config/zathura/zathurarc

        set default-bg                  '#1a1b26'
        set default-fg                  '#a9b1d6'

        set statusbar-fg                '#a9b1d6'
        set statusbar-bg                '#24283b'

        set inputbar-bg                 '#1a1b26'
        set inputbar-fg                 '#73daca'

        set notification-bg             '#1a1b26'
        set notification-fg             '#73daca'

        set notification-error-bg       '#1a1b26'
        set notification-error-fg       '#f7768e'

        set notification-warning-bg     '#1a1b26'
        set notification-warning-fg     '#f7768e'

        set highlight-color             '#e0af68'
        set highlight-active-color      '#9aa5ce'

        set completion-bg               '#24283b'
        set completion-fg               '#a9b1d6'

        set completion-highlight-fg     '#9aa5ce'
        set completion-highlight-bg     '24283b'

        set recolor-lightcolor          'rgba(22, 22, 30, 1)'
        set recolor-darkcolor           '#a9b1d6'

        set recolor                     'true'
        set recolor-keephue             'false'
      ";
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = false;
        format = "$directory$character";
        character = {
          success_symbol = "[>](bold white)";
          error_symbol = "[>](bold white)";
        };
      };
    };

    spotify-player = {
      enable = true;
    };

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  services = {
    systembus-notify.enable = true;
    dunst = {
      enable = true;
      iconTheme = {
        name = "Adwaita";
        package = pkgs.adwaita-icon-theme;
        # size = "32x32";
        size = "64x64";
      };
      settings = {
        global = {
          timeout = 10;
          font = "Liga SFMono Nerd Font 14";
          width = 350;
          height = 100;
          offset = "20x18";

          frame_color = "#343544";
          background = "#2b2c3d";
          foreground = "#c8d3f5";
          corner_radius = 15;
        };
      };
    };
  };

  home.stateVersion = "25.05";
}
