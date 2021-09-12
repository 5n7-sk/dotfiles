local M = {}

M.autocmd = function(group, cmds, clear)
  clear = clear == nil and false or clear

  if type(cmds) == "string" then
    cmds = {cmds}
  end

  vim.cmd("augroup " .. group)

  if clear then
    vim.cmd("autocmd!")
  end

  for _, c in ipairs(cmds) do
    vim.cmd("autocmd " .. c)
  end

  vim.cmd("augroup END")
end

M.bufmap = function(buffer, mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap

  vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, opts)
end

M.bufset = function(buffer, name, value)
  vim.api.nvim_buf_set_option(buffer, name, value)
end

M.map = function(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap

  vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return M
