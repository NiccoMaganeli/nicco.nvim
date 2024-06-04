-- These are Lazy specific keymaps
local lazy = require("lazy")
local lazy_opts = { wait = true, show = false }

function sync_all_packages()
  lazy.sync(lazy_opts)
  print("All packages synced")
end

function clean_all_packages()
  lazy.clean(lazy_opts)
  print("All packages cleaned")
end

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Opens [l]azy dashboard" })
vim.keymap.set("n", "<leader>pa", sync_all_packages, { desc = "Sync all plugins in Lazy" })
vim.keymap.set("n", "<leader>pc", clean_all_packages, { desc = "Clean all unused plugins" })

return {}
