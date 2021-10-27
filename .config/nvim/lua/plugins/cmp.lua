local M = {}

M.config = function()
  local cmp = require("cmp")

  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body)
      end
    },
    sorting = {
      comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,
        require("cmp-under-comparator").under,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order
      }
    },
    mapping = {
      ["<c-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), {"c", "i"}),
      ["<c-j>"] = cmp.mapping(cmp.mapping.select_next_item(), {"c", "i"}),
      ["<c-space>"] = cmp.mapping(cmp.mapping.complete(), {"c", "i"}),
      ["<cr>"] = cmp.mapping({c = cmp.mapping.confirm({select = false}), i = cmp.mapping.confirm({select = true})})
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

        vim_item.menu = ({
          buffer = "[Buffer]",
          calc = "[Calc]",
          cmp_tabnine = "[Tabnine]",
          emoji = "[Emoji]",
          latex_symbols = "[LaTeX]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          path = "[Path]",
          rg = "[RipGrep]",
          spell = "[Spell]",
          ultisnips = "[UltiSnips]"
        })[entry.source.name]

        return vim_item
      end
    },
    sources = {
      {name = "buffer"},
      {name = "calc"},
      {name = "cmp_tabnine"},
      {name = "emoji"},
      {name = "latex_symbols"},
      {name = "nvim_lsp"},
      {name = "nvim_lua"},
      {name = "path"},
      {name = "rg"},
      {name = "spell"},
      {name = "ultisnips"}
    }
  }

  cmp.setup.cmdline("/", {sources = {{name = "buffer"}}})
  cmp.setup.cmdline(":", {sources = cmp.config.sources({{name = "cmdline"}}, {{name = "path"}})})
end

return M
