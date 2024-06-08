-- NOTE: to understand what each configuration is doing here are some useful commands
-- :help vim.opt
-- :help option-list (this gives a whole list which is useful to search for options)

vim.opt.relativenumber = true
vim.opt.mouse = "a" -- Useful for resizing splits
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.g.have_nerd_font = true

-- Keymaps
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

vim.keymap.set("n", "<left>", "<cmd>echo \"Use h to move\"<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo \"Use k to move\"<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo \"Use l to move\"<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo \"Use j to move\"<CR>")

vim.keymap.set("n", "<leader>c", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Go to previous buffer" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- NOTE: Another helpful command :help lua-guide-autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Returning empty table because this file is only for base configs
return {}
