{
  # config,
  pkgs,
  # lib,
  ...
}: {
  imports = [
    # ./modules/nvim.nix
    # ./modules/i3.nix
    # ./modules/polybar.nix
    ./modules/nvim/nvim.nix
    ./modules/i3/i3.nix
    ./modules/i3/polybar.nix
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
      zathura
      zip
      unzip
      feh
      bluetui
      pamixer
      mullvad
      brightnessctl
      # steam
      teams-for-linux
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
      settings = {
        "signons.rememberSignons" = true;
        "privary.clearOnShutdown.cookies" = false;
      };
    };

    kitty = {
      enable = true;
      themeFile = "tokyo_night_night";
      shellIntegration.enableZshIntegration = true;
      font = {
        # package = pkgs.nerd-fonts.fira-code;
        # name = "FiraCode Nerd Font Mono";
        package = pkgs.monaspace;
        name = "Monaspace Argon";
        size = 18;
      };
      settings = {
        background_opacity = "0.90";
        window_padding_width = 4;
        modify_font = "cell_height 1px";
        font_features = "MonaspaceArgon-Regular +ss01 +ss02 +ss03 +ss07 +ss08 +ss09";
        italic_font = "postscript_name=MonaspaceRadon-Regular";
      };
      extraConfig = "
        modify_font underline_position 5
        modify_font underline_thickness 300%
      ";
      # extraConfig = "
      #     foreground #979eab
      #     background #161616
      #
      #     color0 #282c34
      #     color1 #e06c75
      #     color2 #98c379
      #     color3 #e5c07b
      #     color4 #61afef
      #     color5 #be5046
      #     color6 #56b6c2
      #     color7 #979eab
      #     color8 #393e48
      #     color9 #d19a66
      #     color10 #56b6c2
      #     color11 #e5c07b
      #     color12 #61afef
      #     color13 #be5046
      #     color14 #56b6c2
      #     color15 #abb2bf
      #
      #     # Tab Bar
      #
      #     active_tab_foreground   #282c34
      #     active_tab_background   #979eab
      #     inactive_tab_foreground #abb2bf
      #     inactive_tab_background #282c34
      #   ";
      #       extraConfig = "
      #       # The basic colors
      # foreground              #ABB2BF
      # background              #282C34
      # selection_foreground    #282C34
      # selection_background    #ABB2BF
      #
      # # Cursor colors
      # cursor                  #ABB2BF
      # cursor_text_color       #282C34
      #
      # # URL underline color when hovering with mouse
      # url_color               #ABB2BF
      #
      # # Tab bar colors
      # active_tab_foreground   #3F4451
      # active_tab_background   #D7DAE0
      # inactive_tab_foreground #ABB2BF
      # inactive_tab_background #282C34
      #
      # # The 16 terminal colors
      #
      # # black
      # color0 #3F4451
      # color8 #4F5666
      #
      # # red
      # color1 #E06C75
      # color9 #BE5046
      #
      # # green
      # color2  #98C379
      # color10 #A5E075
      #
      # # yellow
      # color3  #D19A66
      # color11 #E5C07B
      #
      # # blue
      # color4  #61AFEF
      # color12 #4DC4FF
      #
      # # purple
      # color5  #C678DD
      # color13 #DE73FF
      #
      # # cyan
      # color6  #56B6C2
      # color14 #4CD1E0
      #
      # # white
      # color7  #D7DAE0
      # color15 #E6E6E6
      #         ";
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
