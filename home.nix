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
      };
    };

    kitty = {
      enable = true;
      themeFile = "OneDark-Pro";
      shellIntegration.enableZshIntegration = true;
      font = {
        # package = pkgs.nerd-fonts.fira-code;
        # name = "FiraCode Nerd Font Mono";
        package = pkgs.nerd-fonts.code-new-roman;
        name = "CodeNewRoman Nerd Font Mono";
        size = 18;
      };
      settings = {
        background_opacity = "0.95";
        window_padding_width = 4;
        modify_font = "cell_height 1px";
      };
      extraConfig = "
          foreground #979eab
          background #161616

          color0 #282c34
          color1 #e06c75
          color2 #98c379
          color3 #e5c07b
          color4 #61afef
          color5 #be5046
          color6 #56b6c2
          color7 #979eab
          color8 #393e48
          color9 #d19a66
          color10 #56b6c2
          color11 #e5c07b
          color12 #61afef
          color13 #be5046
          color14 #56b6c2
          color15 #abb2bf

          # Tab Bar

          active_tab_foreground   #282c34
          active_tab_background   #979eab
          inactive_tab_foreground #abb2bf
          inactive_tab_background #282c34
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
