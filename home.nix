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

    pointerCursor = {
      name = "Adwaita";
      package = pkgs.adwaita-icon-theme;
      gtk.enable = true;
      x11.enable = true;
    };
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
      themeFile = "tokyo_night_night";
      font = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove Nerd Font";
        size = 16;
      };
      settings = {
        window_padding_width = 2;
        modify_font = "cell_height 2px";
        # background_opacity = 0.95;
      };
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
