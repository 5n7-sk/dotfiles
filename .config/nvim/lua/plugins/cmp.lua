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
      ["<c-k>"] = cmp.mapping.select_prev_item(),
      ["<c-j>"] = cmp.mapping.select_next_item(),
      ["<c-u>"] = cmp.mapping.scroll_docs(-5),
      ["<c-d>"] = cmp.mapping.scroll_docs(5),
      ["<c-space>"] = cmp.mapping.complete(),
      ["<c-e>"] = cmp.mapping.close()
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
      {name = "spell"},
      {name = "ultisnips"}
    }
  }
end

return M
