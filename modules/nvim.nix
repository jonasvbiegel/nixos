{
  # config,
  pkgs,
  # lib,
  ...
}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      clipboard = {
        enable = true;
        registers = "unnamedplus";
      };

      git.enable = true;

      mini = {
        ai.enable = true;
        pairs.enable = true;
        surround.enable = true;
        files.enable = true;
      };

      statusline.lualine = {
        enable = true;
        refresh.statusline = 50;
      };

      hideSearchHighlight = true;
      searchCase = "ignore";
      keymaps = [
        # set space to leader key
        {
          key = "<Space>";
          mode = "n";
          silent = true;
          action = "<leader>";
        }
        # set ctrl p to open fzf lua files and leader r to open fzf lua buffers
        {
          key = "<C-p>";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua files<CR>";
        }
        {
          key = "<leader>r";
          mode = "n";
          silent = true;
          action = "<cmd>FzfLua buffers<CR>";
        }
        # make c d and c u do zz after to center
        {
          key = "<C-d>";
          mode = "n";
          silent = true;
          action = "15j zz";
        }
        {
          key = "<C-u>";
          mode = "n";
          silent = true;
          action = "15k zz";
        }
        # keybind to show full diagnostics
        {
          key = "<leader>r";
          mode = "n";
          silent = true;
          action = "<cmd>lua vim.diagnostic.open_float(0, {scope='line'})<CR>";
        }
        # bind f4 to show code actions
        {
          key = "<F4>";
          mode = "n";
          silent = true;
          action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        }
        # make gd and gD to use lsp
        {
          key = "gd";
          mode = "n";
          silent = true;
          action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        }
        {
          key = "gD";
          mode = "n";
          silent = true;
          action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
        }
        {
          key = "<C-æ>";
          mode = "n";
          silent = true;
          action = "<cmd>lua MiniFiles.open()<CR>";
        }
        {
          key = "<leader>n";
          mode = "n";
          silent = true;
          action = "<cmd>NoNeckPain<CR>";
        }
        {
          key = "<C-h>";
          mode = "n";
          silent = true;
          action = "<cmd>wincmd h<CR>";
        }
        {
          key = "<C-l>";
          mode = "n";
          silent = true;
          action = "<cmd>wincmd l<CR>";
        }
      ];

      options = {
        tabstop = 2;
        shiftwidth = 2;
        autoindent = true;
      };

      diagnostics = {
        enable = true;
        config = {
          virtual_text = true;
          signs.text = {
            "vim.diagnostic.severity.WARN" = " ";
            "vim.diagnostic.severity.ERROR" = " ";
          };
        };
      };

      visuals = {
        nvim-cursorline = {
          enable = true;
          setupOpts = {
            cursorline.enable = true;
            cursorline.timeout = 4;
          };
        };
        indent-blankline.enable = true;
        nvim-web-devicons.enable = true;
      };

      autocomplete.nvim-cmp = {
        enable = true;
        mappings = {
          next = "<C-m>";
          previous = "<C-n>";
        };
      };

      theme = {
        enable = true;
        name = "oxocarbon";
        style = "dark";
        # name = "tokyonight";
        # style = "night";
        # transparent = false;
      };

      treesitter = {
        enable = true;
        highlight.enable = true;
        indent.enable = true;
      };

      fzf-lua.enable = true;

      lsp = {
        enable = true;
        formatOnSave = true;
      };

      languages = {
        enableTreesitter = true;
        enableFormat = true;
        nix = {
          enable = true;
          lsp = {
            server = "nixd";
          };
          extraDiagnostics = {
            enable = true;
            types = ["statix"];
          };
        };
        rust = {
          enable = true;
        };
        markdown = {
          enable = true;
          format.package = pkgs.deno;
          extensions.render-markdown-nvim = {
            enable = true;
          };
        };
        html = {
          enable = true;
        };
        css = {
          enable = true;
        };
        ts = {
          enable = true;
        };
        typst = {
          enable = true;
        };
        clang = {
          enable = true;
        };
      };

      extraPlugins = {
        tabout = {
          package = pkgs.vimPlugins.tabout-nvim;
          setup = "require('tabout').setup {}";
        };
        no-neck-pain = {
          package = pkgs.vimPlugins.no-neck-pain-nvim;
          setup = "require('no-neck-pain').setup {}";
        };
      };

      extraLuaFiles = [
        ./yankhighlight.lua
      ];
    };
  };
}
