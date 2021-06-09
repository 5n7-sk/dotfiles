local setup = function()
  vim.g.VM_leader = "<space>"
  vim.g.VM_maps = {
    ["Find Under"] = "<m-d>",
    ["Find Subword Under"] = "<m-d>",
    ["Mouse Cursor"] = "<m-leftmouse>",
    ["Mouse Word"] = "<m-rightmouse>"
  }
  vim.g.VM_mouse_mappings = true
end

return {setup = setup}
