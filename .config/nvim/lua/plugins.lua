vim.cmd("packadd packer.nvim")

return require("packer").startup {
  function(use)
    use {
      "famiu/bufdelete.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<m-w>", "<cmd>lua require(\"bufdelete\").bufdelete(0, true)<cr>")
      end
    }

    use {
      "sudormrfbin/cheatsheet.nvim",
      requires = {"nvim-telescope/telescope.nvim"},
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

    use {
      "sindrets/diffview.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require("diffview").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>df", "<cmd>DiffviewOpen<cr>")
        map("n", "<leader>dF", "<cmd>DiffviewClose<cr>")
      end

    }

    use {"editorconfig/editorconfig-vim"}

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

    use {
      "glepnir/galaxyline.nvim",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = require("plugins.galaxyline").config
    }

    use {"f-person/git-blame.nvim"}

    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("gitsigns").setup()
      end
    }

    use {
      "stevearc/gkeep.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>gk", "<cmd>GkeepToggle<cr>")
      end
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
      end
    }

    use {
      "phaazon/hop.nvim",
      setup = function()
        local map = require("utils").map
        map("n", "<leader><cr>", "<cmd>HopWord<cr>", {silent = true})
      end,
      cmd = {"HopWord"}
    }

    use {"mboughaba/i3config.vim"}

    use {"lewis6991/impatient.nvim", rocks = {"mpack"}}

    use {"lukas-reineke/indent-blankline.nvim"}

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
      end
    }

    use {
      "ahmedkhalf/lsp-rooter.nvim",
      config = function()
        require("lsp-rooter").setup()
      end
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

    use {
      "jghauser/mkdir.nvim",
      config = function()
        require("mkdir")
      end
    }

    use {
      "TimUntersberger/neogit",
      requires = {"nvim-lua/plenary.nvim"},
      setup = function()
        local map = require("utils").map
        map("n", "<leader>gc", "<cmd>Neogit commit<cr>")
      end
    }

    use {
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup {mappings = {"<C-d>", "<C-u>"}}
      end
    }

    use {
      "nacro90/numb.nvim",
      config = function()
        require("numb").setup()
      end
    }

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

        vim.g.indent_blankline_filetype_exclude = {"dashboard", "help", "packer"}
        vim.g.indent_blankline_show_first_indent_level = false
      end
    }

    use {
      "hrsh7th/nvim-cmp",
      requires = {
        {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-calc"},
        {"hrsh7th/cmp-emoji"},
        {"hrsh7th/cmp-nvim-lsp"},
        {"hrsh7th/cmp-nvim-lua"},
        {"hrsh7th/cmp-path"},
        {"onsails/lspkind-nvim"},
        {"quangnguyen30192/cmp-nvim-ultisnips"},
        {"tzachar/cmp-tabnine", run = "./install.sh"},
        {
          "windwp/nvim-autopairs",
          config = function()
            require("nvim-autopairs").setup()
            require("nvim-autopairs.completion.cmp").setup({map_complete = true})
          end
        }
      },
      config = require("plugins.cmp").config,
      setup = function()
        vim.opt.completeopt = {"menuone", "noselect"}
      end
    }

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    }

    use {"yamatsum/nvim-cursorline"}

    use {"kevinhwang91/nvim-hlslens"}

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
      requires = {
        {"ray-x/lsp_signature.nvim"},
        {"williamboman/nvim-lsp-installer", requires = {"rcarriga/nvim-notify"}}
      },
      config = require("plugins.lspconfig").config
    }

    use {"rinx/nvim-minimap", cmd = {"MinimapOpen", "MinimapToggle"}}

    use {
      "AckslD/nvim-neoclip.lua",
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("telescope").load_extension("neoclip")
        require("neoclip").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>cb", "<cmd>Telescope neoclip<cr>")
      end
    }

    use {
      "rcarriga/nvim-notify",
      config = function()
        vim.notify = require("notify")
      end
    }

    use {"famiu/nvim-reload", cmd = {"Reload"}}

    use {"dstein64/nvim-scrollview"}

    use {
      "windwp/nvim-spectre",
      setup = function()
        local map = require("utils").map
        map("n", "<leader>s", "<cmd>lua require(\"spectre\").open()<cr>")
        map("n", "<leader>S", "<cmd>lua require(\"spectre\").open_visual({select_word = true})<cr>")
        map("v", "<leader>s", "<cmd>lua require(\"spectre\").open_visual()<cr>")
      end
    }

    use {
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require("toggleterm").setup {open_mapping = "<c-t>t", direction = "float"}
      end
    }

    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = require("plugins.nvim-tree").config,
      setup = function()
        local map = require("utils").map
        map("n", "<c-b>", "<cmd>NvimTreeToggle<cr>")
      end,
      cmd = {"NvimTreeToggle"}
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = "maintained",
          highlight = {enable = true},
          indent = {enable = true}
        }
      end
    }

    use {
      "nvim-treesitter/nvim-treesitter-textobjects",
      requires = {"nvim-treesitter/nvim-treesitter"},
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
    }

    use {
      "windwp/nvim-ts-autotag",
      requires = {"nvim-treesitter"},
      config = function()
        require("nvim-treesitter.configs").setup {autotag = {enable = true}}
      end
    }

    use {
      "p00f/nvim-ts-rainbow",
      requires = {"nvim-treesitter"},
      config = function()
        require("nvim-treesitter.configs").setup {rainbow = {enable = true}}
      end
    }

    use {
      "pwntester/octo.nvim",
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("octo").setup()
      end
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
      requires = {"nvim-treesitter"},
      config = function()
        require("nvim-treesitter.configs").setup {playground = {enable = true}}
      end,
      cmd = {"TSPlaygroundToggle"}
    }

    use {"andweeb/presence.nvim"}

    use {
      "winston0410/range-highlight.nvim",
      requires = {"winston0410/cmd-parser.nvim"},
      config = function()
        require("range-highlight").setup()
      end
    }

    use {
      "blackCauldron7/surround.nvim",
      config = function()
        require("surround").setup({})
      end
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
      "nvim-telescope/telescope-bibtex.nvim",
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("telescope").load_extension("bibtex")
      end
    }

    use {
      "nvim-telescope/telescope-ghq.nvim",
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("telescope").load_extension("ghq")
      end
    }

    use {
      "nvim-telescope/telescope-github.nvim",
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("telescope").load_extension("gh")
      end
    }

    use {
      "nvim-telescope/telescope-media-files.nvim",
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        require("telescope").load_extension("media_files")
      end
    }

    use {
      "nvim-telescope/telescope-packer.nvim",
      requires = {"nvim-telescope/telescope.nvim"},
      config = function()
        vim.cmd("command! Packers lua require(\"telescope\").extensions.packer.plugins()")
      end,
      cmd = {"Packers"}
    }

    use {"nvim-telescope/telescope-symbols.nvim", requires = {"telescope-nvim/telescope.nvim"}}

    use {
      "fhill2/telescope-ultisnips.nvim",
      requires = {"nvim-telescope/telescope.nvim", "SirVer/ultisnips"},
      config = function()
        require("telescope").load_extension("ultisnips")
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>sp", "<cmd>Telescope ultisnips<cr>")
      end
    }

    use {
      "nvim-telescope/telescope.nvim",
      requires = {"kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"},
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
        map("n", "<c-p>", "<cmd>Telescope commands<cr>")
        map("n", "<leader>ff",
          "<cmd>Telescope find_files find_command=rg,--files,--glob=!.git/**,--hidden,--no-ignore<cr>")
        map("n", "<leader>lg", "<cmd>Telescope live_grep<cr>")
        map("n", "<c-m>", "<cmd>Telescope lsp_workspace_diagnostics<cr>")
      end
    }

    use {
      "folke/todo-comments.nvim",
      requires = {"folke/trouble.nvim", "nvim-telescope/telescope.nvim"},
      config = function()
        require("todo-comments").setup()
      end,
      setup = function()
        local map = require("utils").map
        map("n", "<leader>td", "<cmd>TodoTelescope<cr>")
      end,
      cmd = {"TodoTelescope"}
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
      requires = {"nvim-treesitter/nvim-treesitter"},
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
      end
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
      end
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
      end
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup()
      end
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
      end
    }
  end
}
