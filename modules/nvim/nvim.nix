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
        colors.enable = true;
      };

      tabline.nvimBufferline = {
        enable = true;
        mappings = {
          closeCurrent = "<C-->";
          cycleNext = "<C-.>";
          cyclePrevious = "<C-,>";
        };
        setupOpts = {
          options = {
            buffer_close_icon = "";
            close_icon = "";
            diagnostics = false;
            hover.enabled = false;
            numbers = "none";
            style_preset = "no_italic";
            separator_style = null;
            indicator_style = "none";
            left_trunc_marker = "";
            right_trunc_marker = "";
          };
        };
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
        # {
        #   key = "<C-,>";
        #   mode = "n";
        #   silent = true;
        #   action = "<cmd>FzfLua buffers<CR>";
        # }
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
        # make gd and gD use lsp
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
          key = "<leader>æ";
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
        # move buffer
        # {
        #   key = "<C-h>";
        #   mode = "n";
        #   silent = true;
        #   action = "<cmd>wincmd h<CR>";
        # }
        # {
        #   key = "<C-l>";
        #   mode = "n";
        #   silent = true;
        #   action = "<cmd>wincmd l<CR>";
        # }
        # toggle diagnostics
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
        # open snacks terminal
        {
          key = "<leader>w";
          mode = "n";
          silent = true;
          action = "<cmd>lua Snacks.terminal.toggle()<CR>";
        }

        # snippet next and prev
        {
          key = "<C-l>";
          mode = "i";
          silent = true;
          action = "<cmd>lua vim.snippet.jump(1)<CR>";
        }
        {
          key = "<C-h>";
          mode = "i";
          silent = true;
          action = "<cmd>lua vim.snippet.jump(-1)<CR>";
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
        # rainbow-delimiters.enable = true;
        indent-blankline.enable = true;
        nvim-web-devicons.enable = true;
      };

      utility = {
        snacks-nvim = {
          enable = true;
          setupOpts = {
            terminal.enable = true;
            explorer.enable = true;
          };
        };
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
        name = "tokyonight";
        # style = "night";
        style = "moon";
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
          treesitter.enable = true;
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
          setup = "require('no-neck-pain').setup ({
            buffers = {
              wo = {
                fillchars = 'eob: ',
              },
            },
          })";
        };
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
              # rev = "49372aadaaf04d14a50efaa34150c51d5a8047e1";
              rev = "687ef75fdbd497eabc9eea92b52e7b4d403b3319";
              hash = "sha256-4zpjuu0yvA86bBANww3LAlXUczsSyQ4MGamjBWd3FZM";
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
