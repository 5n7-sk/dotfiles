vim.api.nvim_command("packadd packer.nvim")

return require("packer").startup {
  function(use)
    use {"ahmedkhalf/lsp-rooter.nvim", config = require("config.rooter").config}

    use {
      "akinsho/nvim-toggleterm.lua",
      config = require("config.toggleterm").config
    }

    use "andweeb/presence.nvim"

    use {
      "b3nj5m1n/kommentary",
      config = require("config.kommentary").config,
      setup = require("config.kommentary").setup
    }

    use {
      "blackCauldron7/surround.nvim",
      config = require("config.surround").config
    }

    use {"editorconfig/editorconfig-vim"}

    use {"f-person/git-blame.nvim"}

    use "famiu/nvim-reload"

    use {
      "folke/todo-comments.nvim",
      requires = "folke/trouble.nvim",
      config = function()
        require("todo-comments").setup({})
      end
    }

    use {"folke/tokyonight.nvim", config = require("config.tokyonight").config}

    use {"folke/zen-mode.nvim", config = require("config.zen").config}

    use {
      "hoob3rt/lualine.nvim",
      requires = {"folke/tokyonight.nvim", "kyazdani42/nvim-web-devicons"},
      config = require("config.lualine").config
    }

    use {"windwp/nvim-autopairs", config = require("config.autopairs").config}

    use {"kevinhwang91/nvim-hlslens"}

    use {
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
      setup = require("config.tree").setup
    }

    use {
      "lewis6991/gitsigns.nvim",
      requires = {"nvim-lua/plenary.nvim"},
      config = function()
        require("gitsigns").setup()
      end
    }

    use {"lukas-reineke/format.nvim", config = require("config.format").config}

    use {"MattesGroeger/vim-bookmarks"}

    use {
      "neovim/nvim-lspconfig",
      requires = {
        {"kabouzeid/nvim-lspinstall"},
        {
          "nametake/golangci-lint-langserver",
          run = "go install github.com/nametake/golangci-lint-langserver@latest"
        },
        {"ray-x/lsp_signature.nvim"}
      },
      config = require("config.lspconfig").config
    }

    use {"npxbr/glow.nvim", ft = "markdown"}

    -- use {
    --   "norcalli/nvim-colorizer.lua",
    --   config = require("config.colorizer").config()
    -- }

    use {"norcalli/snippets.nvim", config = require("config.snippets").config}

    use {
      "nvim-lua/completion-nvim",
      requires = {
        {"aca/completion-tabnine", run = "./install.sh"},
        {"nvim-treesitter/completion-treesitter"},
        {"steelsojka/completion-buffers"}
      },
      config = require("config.completion").config,
      setup = require("config.completion").setup
    }

    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim"
      },
      setup = require("config.telescope").setup
    }

    use {
      "glepnir/dashboard-nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
      },
      setup = require("config.dashboard").setup
    }

    use {
      "nvim-telescope/telescope-ghq.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
      },
      config = require("config.telescope-ghq").config
    }

    use {
      "nvim-telescope/telescope-github.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
      },
      config = require("config.telescope-github").config
    }

    use {
      "nvim-telescope/telescope-media-files.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
      },
      config = require("config.telescope-media-files").config
    }

    use {
      "nvim-telescope/telescope-project.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
      },
      config = require("config.telescope-project").config,
      setup = require("config.telescope-project").setup
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      config = require("config.treesitter").config
    }

    use {
      "p00f/nvim-ts-rainbow",
      requires = "nvim-treesitter/nvim-treesitter",
      config = require("config.treesitter-rainbow").config
    }

    use {"phaazon/hop.nvim", setup = require("config.hop").setup}

    use {
      "pwntester/octo.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
      },
      config = require("config.octo").config
    }

    -- use {"ray-x/go.nvim", config = require("config.go").config}

    use {
      "romgrk/barbar.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      setup = require("config.barbar").setup
    }

    use {
      "sudormrfbin/cheatsheet.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
      }
    }

    use {"thinca/vim-quickrun", setup = require("config.quickrun").setup}

    use {"thinca/vim-scouter", opt = true}

    use {
      "TimUntersberger/neogit",
      requires = "nvim-lua/plenary.nvim",
      setup = require("config.neogit").setup
    }

    use {
      "tom-anders/telescope-vim-bookmarks.nvim",
      requires = {
        "MattesGroeger/vim-bookmarks",
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
        "nvim-telescope/telescope.nvim"
      },
      config = require("config.telescope-bookmarks").config,
      setup = require("config.telescope-bookmarks").setup
    }

    use {"wakatime/vim-wakatime"}

    use {
      "wbthomason/packer.nvim",
      opt = true,
      config = require("config.packer").config
    }

    use {"yuki-yano/zero.nvim", config = require("config.zero").config}
  end
}
