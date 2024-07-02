-- NOTE: to understand what each configuration is doing here are some useful commands
-- :help vim.opt
-- :help option-list (this gives a whole list which is useful to search for options)

vim.opt.relativenumber = true
vim.opt.mouse = ""
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
vim.opt.scrolloff = 10
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Key maps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic error messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix list" })

vim.keymap.set("n", "<left>", "<cmd>echo \"Use h to move\"<CR>")
vim.keymap.set("n", "<up>", "<cmd>echo \"Use k to move\"<CR>")
vim.keymap.set("n", "<right>", "<cmd>echo \"Use l to move\"<CR>")
vim.keymap.set("n", "<down>", "<cmd>echo \"Use j to move\"<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>bd<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "[b", "<cmd>bprev<CR>", { desc = "Go to previous buffer" })

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- NOTE: Another helpful command :help lua-guide-autocommands
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-on-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Change CWD to file's project root based on .git",
  pattern = "*",
  group = vim.api.nvim_create_augroup("change-cwd-to-root", { clear = true }),
  callback = function()
    local function is_root(path)
      return vim.fn.isdirectory(path .. "/.git") == 1
    end

    local function find_git_root(path)
      local parent_dir = vim.fn.fnamemodify(path, ":h")

      if path == parent_dir then
        return nil
      elseif is_root(path) then
        return path
      else
        return find_git_root(parent_dir)
      end
    end

    local buf_path = vim.fn.expand("%:p:h")
    local project_root = find_git_root(buf_path)

    if project_root then
      vim.fn.chdir(project_root)
    end
  end,
})

-- Returning empty table because this file is only for base configurations
return {}
