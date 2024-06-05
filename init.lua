-- Installing lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Set leader and localleader before setting up lazy
vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy").setup({
  import = "plugins",
  ui = {},
})
-- END
-- vim: ts=2 sts=2 sw=2 et
