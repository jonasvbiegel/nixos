{
  config,
  pkgs,
  lib,
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
          key = "<C-,>";
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
        {
          key = "<leader>d";
          mode = "n";
          silent = true;
          action = "
            function()
            if vim.diagnostic.is_enabled() then
              vim.diagnostic.enable(false)
            else
              vim.diagnostic.enable()
            end
            end
            ";
          lua = true;
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
        # name = "oxocarbon";
        # style = "dark";
        # name = "onedark";
        # style = "warmer";
        transparent = true;
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
        # this is shitty D:
        # rainbow-delimiters = {
        #   package = pkgs.vimPlugins.rainbow-delimiters-nvim;
        #   #   setup = "require('rainbow-delimiters.setup').setup {
        #   #     priority = {
        #   #       [''] = 110,
        #   #     },
        #   #   }";
        #   # };
        # };
      };

      extraLuaFiles = [
        ./yankhighlight.lua
        ./togglediagnostics.lua
      ];

      extraPlugins = {
        rainbow-delimiters = {
          package = pkgs.vimUtils.buildVimPlugin {
            pname = "rainbow-delimiters";
            version = "0.9.1";
            src = pkgs.fetchFromGitHub {
              owner = "HiPhish";
              repo = "rainbow-delimiters.nvim";
              rev = "49372aadaaf04d14a50efaa34150c51d5a8047e1";
              hash = "sha256-qvYpFcqLJ/DCdgGUaeaEOna9J9Rcsnj98OQr1ioINiI=";
            };
            nvimSkipModules = [
              # rainbow-delimiters.types.lua
              "rainbow-delimiters.types"
              # Test that requires an unpackaged dependency
              "rainbow-delimiters._test.highlight"
            ];
          };
        };
      };
    };
  };
}
