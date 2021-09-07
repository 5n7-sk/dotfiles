pcall(require, "impatient")

vim.g.mapleader = " "

vim.opt.cursorline = true
vim.opt.number = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.virtualedit = "onemore"
vim.opt.whichwrap = vim.o.whichwrap .. "h,l"

-- tab appearance/behavior
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"

vim.opt.timeoutlen = 300

-- disable built-in plugins
local disable_buildtin_plugins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "matchit",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "spellfile_plugin",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin"
}

for _, plugin in pairs(disable_buildtin_plugins) do
  vim.g["loaded_" .. plugin] = 1
end

-- install packer.nvim if not exists
local path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(path)) > 0 then
  vim.fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", path})
end

require("plugins")
require("keymaps")
