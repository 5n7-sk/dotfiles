vim.api.nvim_command("packadd packer.nvim")
require("impatient")

return require("packer").startup {
  function(use)
    -- plugin manager

    -- packer
    use {"wbthomason/packer.nvim", opt = true}

    -- core

    -- speed-up
    use {"lewis6991/impatient.nvim", rocks = {"mpack"}}

    -- coding support

    -- commenting
    use {
      "b3nj5m1n/kommentary",
      config = function()
        local map = require("utils").map
        map("n", "<c-_>", "<Plug>kommentary_line_default", {noremap = false})
        map("v", "<c-_>", "<Plug>kommentary_visual_default", {noremap = false})
      end,
      setup = function()
        vim.g.kommentary_create_default_mappings = false
      end
    }

    -- surrond text
    use {
      "blackCauldron7/surround.nvim",
      config = function()
        require("surround").setup({})
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>df", "<cmd>DiffviewOpen<cr>")
        map("n", "<leader>dF", "<cmd>DiffviewClose<cr>")
      end
    }

    -- completion
    use {
      "hrsh7th/nvim-compe",
      requires = {
        {
          "onsails/lspkind-nvim",
          config = function()
            require("lspkind").init()
          end
        },
        {"tzachar/compe-tabnine", run = "./install.sh"},
        {
          "windwp/nvim-autopairs",
          config = function()
            require("nvim-autopairs").setup()
            require("nvim-autopairs.completion.compe").setup({
              map_complete = true
            })
          end
        }
      },
      config = require("plugins.compe").config,
      setup = function()
        vim.opt.completeopt = {"menuone", "noselect"}
      end
    }

    -- formatter
    use {
      "lukas-reineke/format.nvim",
      config = function()
        local autocmd = require("utils").autocmd
        autocmd("Format", "BufWritePost * FormatWrite", true)

        require("format").setup {
          ["*"] = {{cmd = {"sed -i 's/[ \t]*$//'"}}},
          bash = {{cmd = {"shfmt -i 2 -w"}}},
          javascript = {{cmd = {"prettier -w"}}},
          json = {{cmd = {"prettier -w"}}},
          go = {{cmd = {"goimports -w"}}},
          lua = {{cmd = {"lua-format -i"}}},
          markdown = {{cmd = {"prettier -w"}}},
          python = {{cmd = {"black", "isort -m 3"}}},
          sh = {{cmd = {"shfmt -i 2 -w"}}},
          terraform = {{cmd = {"terraform fmt -write"}}},
          typescript = {{cmd = {"prettier -w"}}},
          yaml = {{cmd = {"prettier -w"}}},
          zsh = {{cmd = {"shfmt -i 2 -w"}}}
        }
      end
    }

    -- snippets
    use {
      "SirVer/ultisnips",
      setup = function()
        vim.g.UltiSnipsSnippetDirectories = {"~/.config/nvim/ultisnips"}
      end
    }

    -- language specific

    -- i3
    -- syntax highlighting
    use {"mboughaba/i3config.vim"}

    -- JSON
    -- jq integration
    use {
      "gennaro-tedesco/nvim-jqx",
      config = function()
        require("nvim-jqx.config").query_key = "Q"
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>jq", "<cmd>JqxList<cr>")
      end,
      ft = {"json"}
    }

    -- Go
    -- LSP support for Go
    use {
      "ray-x/go.nvim",
      config = function()
        require("go").setup()
      end,
      ft = {"go"}
    }

    -- Node.js
    -- show latest package versions in package.json
    use {
      "vuki656/package-info.nvim",
      config = function()
        require("package-info").setup()
      end,
      ft = {"json"}
    }

    -- Python
    -- Poetry integration
    use {
      "petobens/poet-v",
      setup = function()
        vim.g.poetv_auto_activate = true
      end,
      ft = {"python"}
    }

    -- explore

    -- file explorer
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        local map = require("utils").map
        map("n", "<c-b>", "<cmd>NvimTreeToggle<cr>")

        vim.g.nvim_tree_width = 40
      end
    }

    -- Telescope
    use {
      -- Telescope
      {
        "nvim-telescope/telescope.nvim",
        requires = {
          "kyazdani42/nvim-web-devicons",
          "nvim-lua/plenary.nvim",
          "nvim-lua/popup.nvim"
        },
        config = function()
          require("telescope").setup {
            defaults = {
              vimgrep_arguments = {
                "rg",
                "--color=never",
                "--column",
                "--glob=!.git/**",
                "--hidden",
                "--line-number",
                "--no-heading",
                "--smart-case",
                "--with-filename"
              }
            }
          }
        end,
        setup = function()
          local map = require("utils").map
          map("n", "<c-p>",
            "<cmd>lua require(\"telescope.builtin\").commands()<cr>")
          map("n", "<leader>ff",
            "<cmd>lua require(\"telescope.builtin\").find_files({hidden = true})<cr>")
          map("n", "<leader>lg",
            "<cmd>lua require(\"telescope.builtin\").live_grep()<cr>")
        end
      },
      -- UltiSnips integration
      {
        "fhill2/telescope-ultisnips.nvim",
        after = {"telescope.nvim"},
        config = function()
          require("telescope").load_extension("ultisnips")
        end,
        setup = function()
          local map = require("utils").map
          map("n", "<leader>sp", "<cmd>Telescope ultisnips<cr>")
        end
      },
      -- todo viewer
      {
        "folke/todo-comments.nvim",
        after = {"telescope.nvim"},
        requires = {"folke/trouble.nvim"},
        config = function()
          require("todo-comments").setup()
        end,
        setup = function()
          local map = require("utils").map
          map("n", "<leader>td", "<cmd>TodoTelescope<cr>")
        end
      },
      -- bibtex references viewer
      {
        "nvim-telescope/telescope-bibtex.nvim",
        after = {"telescope.nvim"},
        config = function()
          require("telescope").load_extension("bibtex")
        end
      },
      -- ghq integraction
      {
        "nvim-telescope/telescope-ghq.nvim",
        after = {"telescope.nvim"},
        config = function()
          require("telescope").load_extension("ghq")
        end
      },
      -- GitHub integration
      {
        "nvim-telescope/telescope-github.nvim",
        after = {"telescope.nvim"},
        config = function()
          require("telescope").load_extension("gh")
        end
      },
      -- media files viewer
      {
        "nvim-telescope/telescope-media-files.nvim",
        after = {"telescope.nvim"},
        config = function()
          require("telescope").load_extension("media_files")
        end
      },
      -- emoji picker
      {"nvim-telescope/telescope-symbols.nvim", after = {"telescope.nvim"}}
    }

    -- LSP

    -- LSP config
    use {
      "neovim/nvim-lspconfig",
      requires = {
        {
          "ahmedkhalf/lsp-rooter.nvim",
          config = function()
            require("lsp-rooter").setup()
          end
        },
        {"ray-x/lsp_signature.nvim"},
        {"williamboman/nvim-lsp-installer", requires = {"rcarriga/nvim-notify"}}
      },
      config = require("plugins.lspconfig").config
    }

    use {
      "glepnir/lspsaga.nvim",
      config = function()
        require("lspsaga").init_lsp_saga()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<f2>", "<cmd>Lspsaga rename<cr>")
        map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>")
      end
    }

    -- preview definition/implementation as popup
    use {
      "rmagatti/goto-preview",
      config = function()
        require("goto-preview").setup {width = 120, height = 30}
      end,
      setup = function()
        local map = require("utils").map
        map("n", "gpd",
          "<cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        map("n", "gpi",
          "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        map("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>")
      end
    }

    -- appearance

    -- buffer tab
    use {
      "akinsho/nvim-bufferline.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require("bufferline").setup {
          options = {
            middle_mouse_command = "bdelete! %d",
            diagnostics = "nvim_lsp",
            offsets = {{filetype = "NvimTree"}}
          }
        }
      end,
      setup = function()
        local map = require("utils").map
        map("n", "bh", "<cmd>BufferLineCyclePrev<cr>")
        map("n", "bl", "<cmd>BufferLineCycleNext<cr>")
        map("n", "bp", "<cmd>BufferLinePick<cr>")

        vim.g.indent_blankline_filetype_exclude = {
          "dashboard",
          "help",
          "packer"
        }
        vim.g.indent_blankline_show_first_indent_level = false
      end
    }

    -- scrollbar
    use {"dstein64/nvim-scrollview"}

    -- show commit history
    use {"f-person/git-blame.nvim"}

    -- colorscheme
    use {
      "folke/tokyonight.nvim",
      config = function()
        vim.api.nvim_command("colorscheme tokyonight")
      end,
      setup = function()
        vim.g.tokyonight_italic_keywords = false
        vim.g.tokyonight_style = "night"
        vim.opt.termguicolors = true
      end
    }

    -- dashboard
    use {
      "glepnir/dashboard-nvim",
      requires = {"nvim-telescope/telescope.nvim"},
      setup = function()
        local map = require("utils").map
        map("n", "<leader>fb", "<cmd>DashboardJumpMarks<cr>")
        map("n", "<leader>tc", "<cmd>DashboardChangeColorscheme<cr>")
        map("n", "<leader>fh", "<cmd>DashboardFindHistory<cr>")
        map("n", "<leader>fa", "<cmd>DashboardFindWord<cr>")
        map("n", "<leader>cn", "<cmd>DashboardNewFile<cr>")

        vim.g.dashboard_default_executive = "telescope"
      end
    }

    -- status line
    use {
      "glepnir/galaxyline.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = require("plugins.galaxyline").config
    }

    -- smooth scrolling
    use {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup {mappings = {"<C-d>", "<C-u>"}}
      end
    }

    -- highlight search results
    use {"kevinhwang91/nvim-hlslens"}

    -- show Git sings (added, removed, changed)
    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("gitsigns").setup()
      end
    }

    -- indent line
    use {"lukas-reineke/indent-blankline.nvim"}

    -- color code
    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    }

    -- highlight trailing spaces
    use {
      "ntpeters/vim-better-whitespace",
      setup = function()
        vim.g.better_whitespace_filetypes_blacklist = {
          "dashboard",
          "TelescopePrompt"
        }
      end
    }

    -- minimap viewer
    use {"rinx/nvim-minimap", cmd = {"MinimapOpen", "MinimapToggle"}}

    -- highlight ranges entered in command line
    use {
      "winston0410/range-highlight.nvim",
      requires = {"winston0410/cmd-parser.nvim"},
      config = function()
        require("range-highlight").setup()
      end
    }

    -- highlight cursor words
    use {"yamatsum/nvim-cursorline"}

    -- Treesitter
    use {
      -- Treesitter for Neovim
      {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
          require("nvim-treesitter.configs").setup {
            ensure_installed = "maintained",
            highlight = {enable = true},
            indent = {enable = true}
          }
        end
      },
      -- highlight current block
      {
        "folke/twilight.nvim",
        after = {"nvim-treesitter"},
        config = function()
          require("twilight").setup()
        end,
        setup = function()
          local map = require("utils").map
          map("n", "<leader>tw", "<cmd>Twilight<cr>")
        end
      },
      -- text objects
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = {"nvim-treesitter"},
        config = function()
          require("nvim-treesitter.configs").setup {
            textobjects = {
              select = {
                enable = true,
                lookahead = true,
                keymaps = {
                  ["ic"] = "@class.inner",
                  ["oc"] = "@class.outer",
                  ["if"] = "@function.inner",
                  ["of"] = "@function.outer"
                }
              },
              swap = {enable = true, swap_next = {["sw"] = "@parameter.inner"}}
            }
          }
        end
      },
      -- Treesitter information viewer
      {
        "nvim-treesitter/playground",
        after = {"nvim-treesitter"},
        config = function()
          require("nvim-treesitter.configs").setup {
            playground = {enable = true}
          }
        end
      },
      -- rainbow parentheses
      {
        "p00f/nvim-ts-rainbow",
        after = {"nvim-treesitter"},
        config = function()
          require("nvim-treesitter.configs").setup {rainbow = {enable = true}}
        end
      },
      -- complete tags
      {
        "windwp/nvim-ts-autotag",
        after = {"nvim-treesitter"},
        config = function()
          require("nvim-treesitter.configs").setup {autotag = {enable = true}}
        end
      }
    }

    -- tools

    -- terminal on Vim
    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require("toggleterm").setup {
          open_mapping = "<c-t>t",
          direction = "float"
        }
      end
    }

    -- delete buffers
    use {
      "famiu/bufdelete.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<m-w>",
          "<cmd>lua require(\"bufdelete\").bufdelete(0, true)<cr>")
      end
    }

    -- display keymaps
    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup()
      end
    }

    -- automarically mkdir when saving new file
    use {
      "jghauser/mkdir.nvim",
      config = function()
        require("mkdir")
      end
    }

    -- undo history visualizer
    use {
      "mbbill/undotree",
      config = function()
        vim.g.undotree_SetFocusWhenToggle = 1
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>ud", "<cmd>UndotreeToggle<cr>")
      end
    }

    -- peek lines interactively
    use {
      "nacro90/numb.nvim",
      config = function()
        require("numb").setup()
      end
    }

    -- Markdown viewer
    use {
      "npxbr/glow.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>gl", "<cmd>Glow<cr>")
      end,
      ft = "markdown"
    }

    -- EasyMotion
    use {
      "phaazon/hop.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader><cr>", "<cmd>HopWord<cr>", {silent = true})
      end
    }

    -- symbol outline viewer
    use {
      "simrat39/symbols-outline.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>ol", "<cmd>SymbolsOutline<cr>")
      end
    }

    -- diff viewer
    use {
      "sindrets/diffview.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require("diffview").setup()
      end
    }

    -- run script quickly
    use {
      "thinca/vim-quickrun",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>r", "<cmd>QuickRun<cr>")
      end
    }

    -- restart Neovim
    use {"famiu/nvim-reload"}

    -- multi cursor
    use {
      "mg979/vim-visual-multi",
      setup = function()
        vim.g.VM_leader = "<space>"
        vim.g.VM_maps = {
          ["Find Under"] = "<m-d>",
          ["Find Subword Under"] = "<m-d>",
          ["Mouse Cursor"] = "<m-leftmouse>",
          ["Mouse Word"] = "<m-rightmouse>"
        }
        vim.g.VM_mouse_mappings = true
      end
    }

    -- GitHub integration
    use {
      "pwntester/octo.nvim",
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("octo").setup()
      end
    }

    use {
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require("notify")
      end
    }

    -- screenshot
    use {
      "segeljakt/vim-silicon",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>ss", "<cmd>Silicon<cr>")
      end,
      cmd = {"Silicon"}
    }

    -- cheatsheet viewer
    use {
      "sudormrfbin/cheatsheet.nvim",
      requires = {"nvim-telescope/telescope.nvim"}
    }

    -- Git integration
    use {
      "TimUntersberger/neogit",
      requires = {"nvim-lua/plenary.nvim"},
      setup = function()
        local map = require("utils").map
        map("n", "<leader>gc", "<cmd>Neogit commit<cr>")
      end
    }

    -- window selector
    use {
      "tkmpypy/chowcho.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>pw", "<cmd>Chowcho<cr>")
      end
    }

    -- move cursor to beginning of line
    use {
      "yuki-yano/zero.nvim",
      config = function()
        require("zero").setup()
      end
    }

    -- misc

    -- Discord Rich Presence
    use {"andweeb/presence.nvim"}

    use {"drzel/vim-repo-edit", cmd = {"RepoEdit"}}

    -- zen mode
    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>zm", "<cmd>ZenMode<cr>")
      end
    }

    -- editorconfig
    use {"editorconfig/editorconfig-vim"}

    -- calculate power as Vimmer
    use {"thinca/vim-scouter", cmd = {"Scouter"}}
  end
}
