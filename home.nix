{
  # config,
  pkgs,
  # lib,
  ...
}: {
  imports = [
    ./modules/nvim.nix
    ./modules/i3.nix
    ./modules/polybar.nix
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
      dmenu
      discord
      maim
      xclip
      btop
      acpilight
      zathura
      zip
      unzip
      feh
    ];
  };

  programs = {
    git = {
      enable = true;
      userName = "Jonas Vittrup Biegel";
      userEmail = "10519146@ucn.dk";
    };

    gh.enable = true;

    librewolf = {
      enable = true;
    };

    kitty = {
      enable = true;
      themeFile = "adwaita_dark";
      shellIntegration.enableZshIntegration = true;
      font = {
        package = pkgs.nerd-fonts.fira-code;
        name = "FiraCode Nerd Font Mono";
        size = 16;
      };
      settings = {
        background_opacity = "0.95";
        window_padding_width = 4;
        modify_font = "cell_height 1px";
      };
      # oxocarbon theme :D
      extraConfig = "
  foreground #dde1e6
background #161616
selection_foreground #f2f4f8
selection_background #525252

cursor #f2f4f8
cursor_text_color #393939

url_color #ee5396
url_style single

active_border_color #ee5396
inactive_border_color #ff7eb6

bell_border_color #ee5396

wayland_titlebar_color system
macos_titlebar_color system

active_tab_foreground #161616
active_tab_background #ee5396
inactive_tab_foreground #dde1e6
inactive_tab_background #393939
tab_bar_background #161616

color0 #262626
color8 #393939

color1 #ff7eb6
color9 #ff7eb6

color2  #42be65
color10 #42be65

color3  #82cfff
color11 #82cfff

color4  #33b1ff
color12 #33b1ff

color5  #ee5396
color13 #ee5396

color6  #3ddbd9
color14 #3ddbd9

color7  #dde1e6
color15 #ffffff
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
      };
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

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };
  };

  home.stateVersion = "25.05";
}
