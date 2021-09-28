vim.cmd("packadd packer.nvim")

return require("packer").startup {
  function(use)
    use {
      "famiu/bufdelete.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<m-w>", "<cmd>lua require(\"bufdelete\").bufdelete(0, true)<cr>")
      end,
      event = {"BufEnter", "BufRead"}
    }

    use {
      "sudormrfbin/cheatsheet.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      cmd = {"Cheatsheet", "CheatsheetEdit"}
    }

    use {
      "tkmpypy/chowcho.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>pw", "<cmd>Chowcho<cr>")
      end,
      cmd = {"Chowcho"}
    }

    use {
      "glepnir/dashboard-nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      setup = function()
        local map = require("utils").map
        map("n", "<leader>fb", "<cmd>DashboardJumpMarks<cr>")
        map("n", "<leader>tc", "<cmd>DashboardChangeColorscheme<cr>")
        map("n", "<leader>fh", "<cmd>DashboardFindHistory<cr>")
        map("n", "<leader>fa", "<cmd>DashboardFindWord<cr>")
        map("n", "<leader>cn", "<cmd>DashboardNewFile<cr>")

        vim.g.dashboard_default_executive = "telescope"
      end,
      event = {"VimEnter"}
    }

    use {
      "monaqa/dial.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<m-l>", "<plug>(dial-increment)", {noremap = false})
        map("n", "<m-h>", "<plug>(dial-decrement)", {noremap = false})
      end,
      event = {"CursorMoved"}
    }

    use {
      "sindrets/diffview.nvim",
      wants = {"nvim-web-devicons"},
      requires = {{"kyazdani42/nvim-web-devicons", opt = true}},
      config = function()
        require("diffview").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>df", "<cmd>DiffviewOpen<cr>")
        map("n", "<leader>dF", "<cmd>DiffviewClose<cr>")
      end,
      cmd = {"DiffviewOpen"}
    }

    use {
      "kat0h/dps-bufpreview.vim",
      wants = {"denops.vim"},
      requires = {{"vim-denops/denops.vim", opt = true}},
      ft = {"markdown"}
    }

    use {"editorconfig/editorconfig-vim", event = {"BufNewFile", "BufRead"}}

    use {
      "nathom/filetype.nvim",
      setup = function()
        vim.g.did_load_filetypes = 1
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "glacambre/firenvim",
      opt = true,
      run = function()
        vim.fn["firenvim#install"](0)
      end
    }

    use {
      "beauwilliams/focus.nvim",
      config = function()
        require("focus").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {"lukas-reineke/format.nvim", config = require("plugins.format").config, event = {"BufWritePre"}}

    use {
      "glepnir/galaxyline.nvim",
      wants = {"nvim-gps", "nvim-web-devicons", "tokyonight.nvim"},
      requires = {
        {
          "SmiteshP/nvim-gps",
          opt = true,
          config = function()
            require("nvim-gps").setup()
          end
        },
        {"kyazdani42/nvim-web-devicons", opt = true},
        {"folke/tokyonight.nvim", opt = true}
      },
      config = require("plugins.galaxyline").config,
      event = {"BufNewFile", "BufRead"}
    }

    use {"f-person/git-blame.nvim", event = {"BufNewFile", "BufRead"}}

    use {
      "lewis6991/gitsigns.nvim",
      wants = {"plenary.nvim"},
      requires = {{"nvim-lua/plenary.nvim", opt = true}},
      config = function()
        require("gitsigns").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "npxbr/glow.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>gl", "<cmd>Glow<cr>")
      end,
      ft = {"markdown"}
    }

    use {
      "ray-x/go.nvim",
      config = function()
        require("go").setup()
      end,
      ft = {"go"}
    }

    use {
      "rmagatti/goto-preview",
      config = function()
        require("goto-preview").setup {width = 120, height = 30}
      end,
      setup = function()
        local map = require("utils").map
        map("n", "gpd", "<cmd>lua require(\"goto-preview\").goto_preview_definition()<CR>")
        map("n", "gpi", "<cmd>lua require(\"goto-preview\").goto_preview_implementation()<CR>")
        map("n", "gP", "<cmd>lua require(\"goto-preview\").close_all_win()<CR>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "lukas-reineke/headlines.nvim",
      config = function()
        require("headlines").setup()
      end,
      ft = {"markdown", "org"}
    }

    use {
      "phaazon/hop.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader><cr>", "<cmd>HopWord<cr>", {silent = true})
      end,
      cmd = {"HopWord"}
    }

    use {"mboughaba/i3config.vim", ft = {"conf"}}

    use {"lewis6991/impatient.nvim", rocks = {"mpack"}}

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("indent_blankline").setup {space_char_blankline = " ", show_current_context = true}
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "Darazaki/indent-o-matic",
      config = function()
        require("indent-o-matic").setup {max_lines = 2048}
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "b3nj5m1n/kommentary",
      config = function()
        require("kommentary.config").configure_language("default", {prefer_single_line_comments = true})
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<c-_>", "<plug>kommentary_line_default", {noremap = false})
        map("v", "<c-_>", "<plug>kommentary_visual_default", {noremap = false})

        vim.g.kommentary_create_default_mappings = false
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {"notomo/lreload.nvim", opt = true}

    use {
      "ahmedkhalf/lsp-rooter.nvim",
      config = function()
        require("lsp-rooter").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "glepnir/lspsaga.nvim",
      config = function()
        require("lspsaga").init_lsp_saga()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "jghauser/mkdir.nvim",
      config = function()
        require("mkdir")
      end,
      event = {"BufWritePre"}
    }

    use {
      "TimUntersberger/neogit",
      wants = {"plenary.nvim"},
      requires = {{"nvim-lua/plenary.nvim", opt = true}},
      setup = function()
        local map = require("utils").map
        map("n", "<leader>gc", "<cmd>Neogit commit<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup {mappings = {"<C-d>", "<C-u>"}}
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "nacro90/numb.nvim",
      config = function()
        require("numb").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "akinsho/nvim-bufferline.lua",
      wants = {"nvim-web-devicons"},
      requires = {{"kyazdani42/nvim-web-devicons", opt = true}},
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

        vim.g.indent_blankline_filetype_exclude = {"dashboard", "help", "packer"}
        vim.g.indent_blankline_show_first_indent_level = false
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "hrsh7th/nvim-cmp",
      requires = {
        {"hrsh7th/cmp-buffer", after = {"nvim-cmp"}},
        {"hrsh7th/cmp-calc", after = {"nvim-cmp"}},
        {"hrsh7th/cmp-emoji", after = {"nvim-cmp"}},
        {"kdheepak/cmp-latex-symbols", after = {"nvim-cmp"}},
        {"hrsh7th/cmp-nvim-lsp", after = {"nvim-cmp"}},
        {"hrsh7th/cmp-nvim-lua", after = {"nvim-cmp"}},
        {"quangnguyen30192/cmp-nvim-ultisnips", after = {"nvim-cmp"}},
        {"hrsh7th/cmp-path", after = {"nvim-cmp"}},
        {"tzachar/cmp-tabnine", after = {"nvim-cmp"}, run = {"./install.sh"}},
        {"onsails/lspkind-nvim", after = {"nvim-cmp"}},
        {
          "windwp/nvim-autopairs",
          after = {"nvim-cmp"},
          config = function()
            require("nvim-autopairs").setup()
            require("nvim-autopairs.completion.cmp").setup()
          end
        }
      },
      config = require("plugins.cmp").config,
      event = {"InsertEnter"}
    }

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {"yamatsum/nvim-cursorline", event = {"BufNewFile", "BufRead"}}

    use {"kevinhwang91/nvim-hlslens", event = {"BufNewFile", "BufRead"}}

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

    use {
      "neovim/nvim-lspconfig",
      wants = {"lsp_signature.nvim", "nvim-lsp-installer"},
      requires = {{"ray-x/lsp_signature.nvim", opt = true}, {"williamboman/nvim-lsp-installer", opt = true}},
      config = require("plugins.lspconfig").config,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>lr", "<cmd>LspRestart<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {"rinx/nvim-minimap", cmd = {"MinimapOpen", "MinimapToggle"}}

    use {
      "AckslD/nvim-neoclip.lua",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      config = function()
        require("telescope").load_extension("neoclip")
        require("neoclip").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>cb", "<cmd>Telescope neoclip<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require("notify")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {"famiu/nvim-reload", cmd = {"Reload"}}

    use {"dstein64/nvim-scrollview", event = {"BufNewFile", "BufRead"}}

    use {
      "windwp/nvim-spectre",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>s", "<cmd>lua require(\"spectre\").open()<cr>")
        map("n", "<leader>S", "<cmd>lua require(\"spectre\").open_visual({select_word = true})<cr>")
        map("v", "<leader>s", "<cmd>lua require(\"spectre\").open_visual()<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {"alec-gibson/nvim-tetris", cmd = {"Tetris"}}

    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require("toggleterm").setup {open_mapping = "<c-t>t", direction = "float"}
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "xiyaowong/nvim-transparent",
      config = function()
        require("transparent").setup {enable = false}
      end,
      cmd = {"TransparentToggle"}
    }

    use {
      "kyazdani42/nvim-tree.lua",
      wants = {"nvim-web-devicons"},
      requires = {{"kyazdani42/nvim-web-devicons", opt = true}},
      config = require("plugins.nvim-tree").config,
      setup = require("plugins.nvim-tree").setup,
      cmd = {"NvimTreeToggle"}
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = {":TSUpdate"},
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = "maintained",
          highlight = {enable = true},
          indent = {enable = true}
        }
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "romgrk/nvim-treesitter-context",
      wants = {"nvim-treesitter"},
      requires = {{"nvim-treesitter/nvim-treesitter", opt = true}},
      config = function()
        require("treesitter-context").setup {enable = true, throttle = true}
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      wants = {"nvim-treesitter"},
      requires = {{"nvim-treesitter/nvim-treesitter", opt = true}},
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
            swap = {enable = true, swap_next = {["<leader>sw"] = "@parameter.inner"}}
          }
        }
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "windwp/nvim-ts-autotag",
      wants = {"nvim-treesitter"},
      requires = {{"nvim-treesitter", opt = true}},
      config = function()
        require("nvim-treesitter.configs").setup {autotag = {enable = true}}
      end,
      ft = {"html", "xml"}
    }

    use {
      "p00f/nvim-ts-rainbow",
      wants = {"nvim-treesitter"},
      requires = {{"nvim-treesitter", opt = true}},
      config = function()
        require("nvim-treesitter.configs").setup {rainbow = {enable = true}}
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "haringsrob/nvim_context_vt",
      wants = {"nvim-treesitter"},
      requires = {{"nvim-treesitter", opt = true}},
      event = {"BufNewFile", "BufRead"}
    }

    use {"seandewar/nvimesweeper", cmd = {"Nvimesweeper"}}

    use {
      "pwntester/octo.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      config = function()
        require("octo").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "kristijanhusak/orgmode.nvim",
      config = function()
        require("orgmode").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "vuki656/package-info.nvim",
      config = function()
        require("package-info").setup()
      end,
      ft = {"json"}
    }

    use {"wbthomason/packer.nvim", opt = true}

    use {
      "nvim-treesitter/playground",
      wants = {"nvim-treesitter"},
      requires = {{"nvim-treesitter", wants = true}},
      config = function()
        require("nvim-treesitter.configs").setup {playground = {enable = true}}
      end,
      cmd = {"TSPlaygroundToggle"}
    }

    use {"andweeb/presence.nvim", event = {"BufNewFile", "BufRead"}}

    use {
      "winston0410/range-highlight.nvim",
      wants = {"cmd-parser.nvim"},
      requires = {{"winston0410/cmd-parser.nvim", opt = true}},
      config = function()
        require("range-highlight").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {"tversteeg/registers.nvim", cmd = {"Registers"}}

    use {
      "sidebar-nvim/sidebar.nvim",
      wants = {"todo-comments.nvim"},
      requires = {{"folke/todo-comments.nvim", opt = true}},
      rocks = {"luatz"},
      config = function()
        require("sidebar-nvim").setup {
          bindings = {
            ["q"] = function()
              require("sidebar-nvim").close()
            end
          },
          sections = {"datetime", "git-status", "lsp-diagnostics", "todos"},
          datetime = {format = "%Y-%m-%d %a %H:%M:%S"}
        }
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>sb", "<cmd>SidebarNvimToggle<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "blackCauldron7/surround.nvim",
      config = function()
        require("surround").setup({})
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "simrat39/symbols-outline.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>ol", "<cmd>SymbolsOutline<cr>")
      end,
      cmd = {"SymbolsOutline"}
    }

    use {
      "abecodes/tabout.nvim",
      wants = {"nvim-treesitter"},
      requires = {{"nvim-treesitter", opt = true}},
      config = function()
        require("tabout").setup()
      end,
      event = {"InsertEnter"}
    }

    use {
      "nvim-telescope/telescope-bibtex.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      config = function()
        require("telescope").load_extension("bibtex")
      end,
      ft = {"bib", "tex"}
    }

    use {
      "nvim-telescope/telescope-ghq.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      config = function()
        require("telescope").load_extension("ghq")
      end,
      map = function()
        local map = require("utils").map
        map("n", "<leader>ghq", "<cmd>Telescope ghq list<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "nvim-telescope/telescope-github.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      config = function()
        require("telescope").load_extension("gh")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "crispgm/telescope-heading.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      config = function()
        require("telescope").load_extension("heading")
      end,
      ft = {"markdown"}
    }

    use {
      "nvim-telescope/telescope-media-files.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      config = function()
        require("telescope").load_extension("media_files")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "nvim-telescope/telescope-packer.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      config = function()
        vim.cmd("command! Packers lua require(\"telescope\").extensions.packer.plugins()")
      end,
      cmd = {"Packers"}
    }

    use {
      "nvim-telescope/telescope-symbols.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}},
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "fhill2/telescope-ultisnips.nvim",
      wants = {"telescope.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}, {"SirVer/ultisnips", opt = true}},
      config = function()
        require("telescope").load_extension("ultisnips")
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>sp", "<cmd>Telescope ultisnips<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "nvim-telescope/telescope.nvim",
      wants = {"nvim-web-devicons", "plenary.nvim"},
      requires = {{"kyazdani42/nvim-web-devicons", opt = true}, {"nvim-lua/plenary.nvim", opt = true}},
      config = require("plugins.telescope").config,
      setup = require("plugins.telescope").setup,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "folke/todo-comments.nvim",
      wants = {"telescope.nvim", "trouble.nvim"},
      requires = {{"nvim-telescope/telescope.nvim", opt = true}, {"folke/trouble.nvim", opt = true}},
      config = function()
        require("todo-comments").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>td", "<cmd>TodoTelescope<cr>")
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "folke/tokyonight.nvim",
      config = function()
        vim.cmd("colorscheme tokyonight")
      end,
      setup = function()
        vim.g.tokyonight_italic_keywords = false
        vim.g.tokyonight_style = "night"
        vim.opt.termguicolors = true
      end
    }

    use {
      "folke/twilight.nvim",
      wants = {"nvim-treesitter"},
      requires = {{"nvim-treesitter/nvim-treesitter", opt = true}},
      config = function()
        require("twilight").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>tw", "<cmd>Twilight<cr>")
      end,
      cmd = {"Twilight"}
    }

    use {
      "SirVer/ultisnips",
      setup = function()
        vim.g.UltiSnipsSnippetDirectories = {"~/.config/nvim/ultisnips"}
        vim.g.UltiSnipsExpandTrigger = "<nul>"
        vim.g.UltiSnipsJumpForwardTrigger = "<c-n>"
        vim.g.UltiSnipsJumpBackwardTrigger = "<c-p>"
      end,
      event = {"InsertEnter"}
    }

    use {
      "mbbill/undotree",
      config = function()
        vim.g.undotree_SetFocusWhenToggle = 1
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>ud", "<cmd>UndotreeToggle<cr>")
      end,
      cmd = {"UndotreeToggle"}
    }

    use {
      "ntpeters/vim-better-whitespace",
      setup = function()
        vim.g.better_whitespace_filetypes_blacklist = {"dashboard", "TelescopePrompt"}
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {"dhruvasagar/vim-marp", ft = {"markdown"}}

    use {
      "heavenshell/vim-pydocstring",
      run = {"make install"},
      setup = function()
        local map = require("utils").map
        map("n", "<leader>ds", "<cmd>Pydocstring<cr>")

        vim.g.pydocstring_formatter = "google"
        vim.g.pydocstring_enable_mapping = false
      end,
      ft = {"python"}
    }

    use {
      "thinca/vim-quickrun",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>r", "<cmd>QuickRun<cr>")
      end,
      cmd = {"QuickRun"}
    }

    use {"drzel/vim-repo-edit", cmd = {"RepoEdit"}}

    use {"thinca/vim-scouter", cmd = {"Scouter"}}

    use {
      "segeljakt/vim-silicon",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>ss", "<cmd>Silicon<cr>")
      end,
      cmd = {"Silicon"}
    }

    use {"dstein64/vim-startuptime", cmd = {"StartupTime"}}

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
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup()
      end,
      event = {"BufNewFile", "BufRead"}
    }

    use {
      "sindrets/winshift.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<c-m-h>", "<cmd>WinShift left<cr>")
        map("n", "<c-m-j>", "<cmd>WinShift down<cr>")
        map("n", "<c-m-k>", "<cmd>WinShift up<cr>")
        map("n", "<c-m-l>", "<cmd>WinShift right<cr>")
      end,
      cmd = {"WinShift"}
    }

    use {
      "folke/zen-mode.nvim",
      config = function()
        require("zen-mode").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>zm", "<cmd>ZenMode<cr>")
      end,
      cmd = {"ZenMode"}
    }

    use {
      "yuki-yano/zero.nvim",
      config = function()
        require("zero").setup()
      end,
      keys = {"0"}
    }
  end
}
