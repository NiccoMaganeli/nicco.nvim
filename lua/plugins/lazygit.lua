return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  cmd = {
    "LazyGit",
    "LazyGitConfig",
    "LazyGitCurrentFile",
    "LazyGitFilter",
    "LazyGitFilterCurrentFile",
  },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<CR>", desc = "Open lazygit" },
  },
  config = function()
    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "Disable all highlights when opening Lazygit",
      callback = function()
        if LAZYGIT_BUFFER ~= nil then
          vim.cmd.hi("clear")
        end
      end,
    })

    vim.api.nvim_create_autocmd("BufWinLeave", {
      desc = "Enable highlights when Lazygit is closed",
      callback = function()
        if LAZYGIT_BUFFER == nil then
          vim.cmd.colorscheme(vim.g.current_colorscheme)
        end
      end,
    })
  end,
}
