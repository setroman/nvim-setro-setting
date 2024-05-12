local ls = require("luasnip")

local M = {}

M.default = function()
  -- is my expansion key
  -- this will expand the current item or jump to the next item within the snippet.
  vim.keymap.set({ "i", "s" }, "<C-K>", function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end, { silent = true })

  -- is my jump backwards key.
  -- this always moves to the previous item within the snippet
  vim.keymap.set({ "i", "s" }, "<C-J>", function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end, { silent = true })

  -- is selecting within a list of options.
  -- This is useful for choice nodes (introduced in the forthcoming episode 2)
  vim.keymap.set("i", "<C-E>", function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end)
end

return M
