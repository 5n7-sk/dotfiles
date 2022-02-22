vim.cmd("packadd packer.nvim")

vim.cmd([[
  augroup PackerUserConfig
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    autocmd User PackerCompileDone lua vim.notify("[Packer] Compiled")
  augroup END
]])

require("packer").init({
  display = {
    open_fn = require("packer.util").float,
  },
})

return require("packer").startup({
  function(use)
    use({
      "famiu/bufdelete.nvim",
      setup = function()
        vim.keymap.set("n", "<m-w>", function()
          require("bufdelete").bufdelete(0, true)
        end)
      end,
      event = { "VimEnter" },
    })

    use({
      "numToStr/Comment.nvim",
      config = function()
        require("Comment").setup({})
      end,
      event = { "VimEnter" },
    })

    use({
      "monaqa/dial.nvim",
      setup = function()
        vim.keymap.set({ "n", "v" }, "<c-a>", "<plug>(dial-increment)")
        vim.keymap.set({ "n", "v" }, "<c-x>", "<plug>(dial-decrement)")
        vim.keymap.set("v", "g<c-a>", "<plug>(dial-increment-additional)")
        vim.keymap.set("v", "g<c-x>", "<plug>(dial-decrement-additional)")
      end,
      event = { "CursorMoved" },
    })

    use({
      "j-hui/fidget.nvim",
      after = { "nvim-lspconfig" },
      config = function()
        require("fidget").setup()
      end,
    })

    use({ "rafamadriz/friendly-snippets", event = { "VimEnter" } })

    use({ "f-person/git-blame.nvim", event = { "VimEnter" } })

    use({
      "lewis6991/gitsigns.nvim",
      config = function()
        require("gitsigns").setup()
      end,
      event = { "VimEnter" },
    })

    use({
      "aspeddro/gitui.nvim",
      config = function()
        require("gitui").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>gg", "<cmd>Gitui<cr>")
      end,
      cmd = { "Gitui" },
    })

    use({
      "ray-x/go.nvim",
      run = { ":GoUpdateBinaries" },
      config = function()
        require("go").setup()
      end,
      cmd = { "GoUpdateBinaries" },
      ft = { "go" },
    })

    use({
      "edolphin-ydf/goimpl.nvim",
      after = { "nvim-treesitter", "telescope.nvim" },
      config = function()
        require("telescope").load_extension("goimpl")
      end,
      setup = function()
        vim.keymap.set("n", "<leader>im", function()
          require("telescope").extensions.goimpl.goimpl()
        end)
      end,
    })

    use({
      "rmagatti/goto-preview",
      after = { "nvim-lspconfig" },
      config = function()
        require("goto-preview").setup({ width = 120, height = 30 })
      end,
      setup = function()
        vim.keymap.set("n", "gpd", function()
          require("goto-preview").goto_preview_definition()
        end)
        vim.keymap.set("n", "gpi", function()
          require("goto-preview").goto_preview_implementation()
        end)
        vim.keymap.set("n", "gP", function()
          require("goto-preview").close_all_win()
        end)
      end,
    })

    use({
      "phaazon/hop.nvim",
      config = function()
        require("hop").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader><cr>", "<cmd>HopWord<cr>")
      end,
      cmd = { "HopWord" },
    })

    -- use({ "lewis6991/impatient.nvim" })

    use({
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require("indent_blankline").setup({ space_char_blankline = " ", show_current_context = true })
      end,
      event = { "VimEnter" },
    })

    use({
      "Darazaki/indent-o-matic",
      config = function()
        require("indent-o-matic").setup({})
      end,
      event = { "VimEnter" },
    })

    use({
      "ray-x/lsp_signature.nvim",
      config = function()
        require("lsp_signature").setup()
      end,
      event = { "VimEnter" },
    })

    use({ "onsails/lspkind-nvim", event = { "VimEnter" } })

    use({
      "nvim-lualine/lualine.nvim",
      after = { "nvim-gps", "tokyonight.nvim" },
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
      },
      config = function()
        require("lualine").setup({
          options = {
            theme = "tokyonight",
          },
          sections = {
            lualine_a = { { "mode" } },
            lualine_b = { { "filename", path = 1 } },
            lualine_c = { { require("nvim-gps").get_location } },
            lualine_x = { { "encoding" }, { "fileformat" }, { "filetype", icon_only = true } },
            lualine_y = { { "branch" }, { "diff" }, { "diagnostics" } },
            lualine_z = { { "location" } },
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { "filename", path = 1 } },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
          },
          extensions = {
            {
              sections = { lualine_b = { { "filetype" } } },
              filetypes = { "NvimTree", "packer" },
            },
          },
        })
      end,
    })

    use({
      "L3MON4D3/LuaSnip",
      after = { "friendly-snippets" },
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    })

    use({
      "karb94/neoscroll.nvim",
      config = function()
        require("neoscroll").setup({
          mappings = { "<c-d>", "<c-e>", "<c-u>", "<c-y>" },
        })
      end,
      event = { "VimEnter" },
    })

    use({
      "jose-elias-alvarez/null-ls.nvim",
      after = { "nvim-lspconfig" },
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("null-ls").setup({
          sources = {
            -- diagnostics
            require("null-ls").builtins.diagnostics.actionlint,
            require("null-ls").builtins.diagnostics.flake8,
            require("null-ls").builtins.diagnostics.markdownlint,
            require("null-ls").builtins.diagnostics.protolint,
            require("null-ls").builtins.diagnostics.shellcheck,
            require("null-ls").builtins.diagnostics.staticcheck,
            require("null-ls").builtins.diagnostics.zsh,
            -- formatting
            require("null-ls").builtins.formatting.black,
            require("null-ls").builtins.formatting.clang_format,
            require("null-ls").builtins.formatting.goimports,
            require("null-ls").builtins.formatting.isort,
            require("null-ls").builtins.formatting.latexindent,
            require("null-ls").builtins.formatting.markdownlint,
            require("null-ls").builtins.formatting.prettier,
            require("null-ls").builtins.formatting.protolint,
            require("null-ls").builtins.formatting.shfmt,
            require("null-ls").builtins.formatting.stylua,
            require("null-ls").builtins.formatting.trim_newlines,
          },
          on_attach = function(client)
            if client.resolved_capabilities.document_formatting then
              vim.cmd([[
                augroup LspFormatting
                  autocmd! * <buffer>
                  autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
                augroup END
              ]])
            end
          end,
        })
      end,
    })

    use({
      "nacro90/numb.nvim",
      config = function()
        require("numb").setup()
      end,
      event = { "CmdlineEnter" },
    })

    use({
      "windwp/nvim-autopairs",
      after = { "nvim-cmp" },
      config = function()
        require("nvim-autopairs").setup()
        require("cmp").event:on(
          "confirm_done",
          require("nvim-autopairs.completion.cmp").on_confirm_done({ map_char = { tex = "" } })
        )
      end,
    })

    use({
      "hrsh7th/nvim-cmp",
      after = { "lspkind-nvim", "LuaSnip" },
      requires = {
        { "hrsh7th/cmp-buffer", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-calc", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-cmdline", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-emoji", after = { "nvim-cmp" } },
        -- { "petertriho/cmp-git", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-nvim-lua", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-nvim-lsp", after = { "nvim-cmp" } },
        { "hrsh7th/cmp-path", after = { "nvim-cmp" } },
        { "lukas-reineke/cmp-rg", after = { "nvim-cmp" } },
        { "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp" } },
      },
      config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = {
            ["<c-e>"] = cmp.mapping({ c = cmp.mapping.close(), i = cmp.mapping.abort() }),
            ["<c-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c", "i" }),
            ["<c-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c", "i" }),
            ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), { "c", "i" }),
            ["<cr>"] = cmp.mapping({
              c = cmp.mapping.confirm({ select = false }),
              i = cmp.mapping.confirm({ select = true }),
            }),
            ["<tab>"] = cmp.mapping(function(fallback)
              if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<s-tab>"] = cmp.mapping(function(fallback)
              if luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end, { "i", "s" }),
          },
          formatting = {
            format = require("lspkind").cmp_format({
              with_text = true,
              menu = {
                buffer = "[Buffer]",
                calc = "[Calc]",
                emoji = "[Emoji]",
                -- cmp_git = "[Git]",
                luasnip = "[Snip]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                path = "[Path]",
                rg = "[RipGrep]",
              },
            }),
          },
          sources = cmp.config.sources({
            { name = "buffer" },
            { name = "calc" },
            { name = "emoji" },
            { name = "luasnip" },
            { name = "nvim_lsp" },
            { name = "nvim_lua" },
            { name = "path" },
            { name = "rg" },
          }),
        })

        cmp.setup.filetype("gitcommit", {
          sources = cmp.config.sources({
            { name = "buffer" },
            { name = "emoji" },
            -- { name = "cmp_git" },
            { name = "rg" },
          }),
        })

        cmp.setup.cmdline("/", {
          sources = cmp.config.sources({
            { name = "buffer" },
          }),
        })

        cmp.setup.cmdline(":", {
          sources = cmp.config.sources({
            { name = "cmdline" },
          }),
        })
      end,
      event = { "CmdlineEnter", "InsertEnter" },
    })

    use({
      "noib3/nvim-cokeline",
      after = { "tokyonight.nvim" },
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
      },
      config = function()
        require("cokeline").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<m-h>", "<plug>(cokeline-focus-prev)")
        vim.keymap.set("n", "<m-l>", "<plug>(cokeline-focus-next)")

        vim.keymap.set("n", "<m-1>", "<plug>(cokeline-focus-1)")
        vim.keymap.set("n", "<m-2>", "<plug>(cokeline-focus-2)")
        vim.keymap.set("n", "<m-3>", "<plug>(cokeline-focus-3)")
        vim.keymap.set("n", "<m-4>", "<plug>(cokeline-focus-4)")
        vim.keymap.set("n", "<m-5>", "<plug>(cokeline-focus-5)")
        vim.keymap.set("n", "<m-6>", "<plug>(cokeline-focus-6)")
        vim.keymap.set("n", "<m-7>", "<plug>(cokeline-focus-7)")
        vim.keymap.set("n", "<m-8>", "<plug>(cokeline-focus-8)")
        vim.keymap.set("n", "<m-9>", "<plug>(cokeline-focus-9)")
        vim.keymap.set("n", "<m-0>", "<plug>(cokeline-focus-10)")
      end,
    })

    use({
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end,
      event = { "VimEnter" },
    })

    use({ "yamatsum/nvim-cursorline", event = { "VimEnter" } })

    use({
      "booperlv/nvim-gomove",
      config = function()
        require("gomove").setup({
          map_defaults = false,
        })
      end,
      setup = function()
        vim.keymap.set("n", "<m-left>", "<plug>GoNSMLeft")
        vim.keymap.set("n", "<m-down>", "<plug>GoNSMDown")
        vim.keymap.set("n", "<m-right>", "<plug>GoNSMRight")
        vim.keymap.set("n", "<m-up>", "<plug>GoNSMUp")

        vim.keymap.set("v", "<m-left>", "<plug>GoVSMLeft")
        vim.keymap.set("v", "<m-down>", "<plug>GoVSMDown")
        vim.keymap.set("v", "<m-right>", "<plug>GoVSMRight")
        vim.keymap.set("v", "<m-up>", "<plug>GoVSMUp")
      end,
      event = { "VimEnter" },
    })

    use({
      "SmiteshP/nvim-gps",
      after = { "nvim-treesitter" },
      config = function()
        require("nvim-gps").setup()
      end,
    })

    use({ "kevinhwang91/nvim-hlslens", event = { "CmdLineEnter" } })

    use({ "williamboman/nvim-lsp-installer", event = { "VimEnter" } })

    use({
      "neovim/nvim-lspconfig",
      after = { "lsp_signature.nvim", "nvim-lsp-installer" },
      config = function()
        local installer = require("nvim-lsp-installer.servers")

        local on_attach = function(_, buffer)
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buffer })
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buffer })
          vim.keymap.set("n", "<c-i>", vim.lsp.buf.hover, { buffer = buffer })
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = buffer })
          vim.keymap.set("n", "<f2>", vim.lsp.buf.rename, { buffer = buffer })
        end

        local servers = { "clangd", "gopls", "pyright", "sumneko_lua", "vimls" }

        for _, server_name in pairs(servers) do
          local ok, server = installer.get_server(server_name)
          if ok then
            server:on_ready(function()
              local opts = { on_attach = on_attach }

              if server_name == "gopls" then
                opts.on_attach = function(client, buffer)
                  on_attach(client, buffer)
                  client.resolved_capabilities.document_formatting = false
                  client.resolved_capabilities.document_range_formatting = false
                end
              end

              server:setup(opts)
            end)
            if not server:is_installed() then
              server:install()
            end
          end
        end
      end,
    })

    use({
      "rcarriga/nvim-notify",
      after = { "telescope.nvim" },
      config = function()
        vim.notify = require("notify")
      end,
      setup = function()
        vim.keymap.set("n", "<leader>nf", function()
          require("telescope").extensions.notify.notify()
        end)
      end,
    })

    use({ "dstein64/nvim-scrollview", event = { "VimEnter" } })

    use({
      "akinsho/nvim-toggleterm.lua",
      config = function()
        require("toggleterm").setup({ open_mapping = "<c-t>t", direction = "float" })
      end,
      keys = { "<c-t>t" },
    })

    use({
      "kyazdani42/nvim-tree.lua",
      requires = {
        { "kyazdani42/nvim-web-devicons", opt = true },
      },
      config = function()
        local cb = require("nvim-tree.config").nvim_tree_callback

        require("nvim-tree").setup({
          diagnostics = { enable = true },
          git = { ignore = false },
          view = {
            width = 40,
            mappings = {
              custom_only = true,
              list = {
                { key = { "<cr>" }, cb = cb("edit") },
                { key = { "l" }, cb = cb("cd") },
                { key = { "<c-v>" }, cb = cb("vsplit") },
                { key = { "<c-x>" }, cb = cb("split") },
                { key = { "<c-t>" }, cb = cb("tabnew") },
                { key = { "<" }, cb = cb("prev_sibling") },
                { key = { ">" }, cb = cb("next_sibling") },
                { key = { "P" }, cb = cb("parent_node") },
                { key = { "<bs>" }, cb = cb("close_node") },
                { key = { "<s-cr>" }, cb = cb("close_node") },
                { key = { "<tab>" }, cb = cb("preview") },
                { key = { "K" }, cb = cb("first_sibling") },
                { key = { "J" }, cb = cb("last_sibling") },
                { key = { "I" }, cb = cb("toggle_ignored") },
                { key = { "H" }, cb = cb("toggle_dotfiles") },
                { key = { "R" }, cb = cb("refresh") },
                { key = { "a" }, cb = cb("create") },
                { key = { "d" }, cb = cb("remove") },
                { key = { "r", "<f2>" }, cb = cb("rename") },
                { key = { "<c-r>" }, cb = cb("full_rename") },
                { key = { "x" }, cb = cb("cut") },
                { key = { "c" }, cb = cb("copy") },
                { key = { "p" }, cb = cb("paste") },
                { key = { "y" }, cb = cb("copy_name") },
                { key = { "Y" }, cb = cb("copy_path") },
                { key = { "gy" }, cb = cb("copy_absolute_path") },
                { key = { "[c}" }, cb = cb("prev_git_item") },
                { key = { "]c}" }, cb = cb("next_git_item") },
                { key = { "h" }, cb = cb("dir_up") },
                { key = { "o" }, cb = cb("system_open") },
                { key = { "q" }, cb = cb("close") },
                { key = { "g?" }, cb = cb("toggle_help") },
              },
            },
          },
        })
      end,
      setup = function()
        vim.keymap.set("n", "<c-b>", "<cmd>NvimTreeToggle<cr>")
      end,
    })

    use({
      "nvim-treesitter/nvim-treesitter",
      run = { ":TSUpdate" },
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = "maintained",
          highlight = { enable = true },
        })
      end,
      event = { "VimEnter" },
    })

    use({
      "nvim-treesitter/nvim-treesitter-textobjects",
      after = { "nvim-treesitter" },
      config = function()
        require("nvim-treesitter.configs").setup({
          textobjects = {
            select = {
              enable = true,
              keymaps = {
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
              },
            },
          },
        })
      end,
    })

    use({
      "p00f/nvim-ts-rainbow",
      after = { "nvim-treesitter" },
      config = function()
        require("nvim-treesitter.configs").setup({ rainbow = { enable = true } })
      end,
    })

    use({ "kyazdani42/nvim-web-devicons" })

    use({ "haringsrob/nvim_context_vt", after = { "nvim-treesitter" } })

    use({
      "wbthomason/packer.nvim",
      setup = function()
        vim.keymap.set("n", "<leader>pc", "<cmd>PackerCompile<cr>")
        vim.keymap.set("n", "<leader>ps", "<cmd>PackerSync<cr>")
        vim.keymap.set("n", "<leader>pt", "<cmd>PackerStatus<cr>")
      end,
    })

    use({
      "nvim-treesitter/playground",
      after = { "nvim-treesitter" },
      config = function()
        require("nvim-treesitter.configs").setup({ playground = { enable = true } })
      end,
    })

    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "kyazdani42/nvim-web-devicons", opt = true }, { "nvim-lua/plenary.nvim" } },
      setup = function()
        vim.keymap.set("n", "<leader>dx", function()
          require("telescope.builtin").diagnostics()
        end)
        vim.keymap.set("n", "<leader>ff", function()
          require("telescope.builtin").find_files({ hidden = true })
        end)
        vim.keymap.set("n", "<leader>lg", function()
          require("telescope.builtin").live_grep({
            additional_args = function()
              return "--hidden"
            end,
          })
        end)
      end,
      event = { "VimEnter" },
    })

    use({
      "folke/tokyonight.nvim",
      config = function()
        vim.cmd("colorscheme tokyonight")
      end,
      setup = function()
        vim.g.tokyonight_italic_keywords = false
        vim.g.tokyonight_style = "night"
        vim.opt.termguicolors = true
      end,
    })

    use({
      "folke/trouble.nvim",
      after = { "nvim-lspconfig" },
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("trouble").setup()
      end,
      setup = function()
        vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
        vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
      end,
    })

    use({
      "heavenshell/vim-pydocstring",
      run = { "make install" },
      setup = function()
        vim.keymap.set("n", "<leader>ds", "<cmd>Pydocstring<cr>")

        vim.g.pydocstring_enable_mapping = false
        vim.g.pydocstring_formatter = "google"
      end,
      ft = { "python" },
    })

    use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })

    use({
      "yuki-yano/zero.nvim",
      config = function()
        require("zero").setup()
      end,
      keys = { "0" },
    })
  end,
})
