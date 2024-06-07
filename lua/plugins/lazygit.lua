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
    vim.g.lazygit_use_custom_config_file_path = 1
    vim.g.lazygit_config_file_path = vim.fn.stdpath("config") .. "/lazygit_config.yaml"
  end,
}
