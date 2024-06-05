-- These are Lazy specific keymaps
local lazy = require("lazy")
local lazy_opts = { wait = true, show = false }

local function sync_all_packages()
  lazy.sync(lazy_opts)
  print("All packages synced")
end

local function clean_all_packages()
  lazy.clean(lazy_opts)
  print("All packages cleaned")
end

vim.keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Opens lazy dashboard" })
vim.keymap.set("n", "<leader>la", sync_all_packages, { desc = "Sync all plugins in Lazy" })
vim.keymap.set("n", "<leader>lc", clean_all_packages, { desc = "Clean all unused plugins" })

-- Returning empty table because I just care about the keymaps
return {}
