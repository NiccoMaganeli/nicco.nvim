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
  init = function()
    vim.g.lazygit_use_custom_config_file_path = 1
    vim.g.lazygit_config_file_path = vim.fn.stdpath("config") .. "/lazygit_config.yaml"
  end,
  config = function()
    vim.api.nvim_create_autocmd("BufWinEnter", {
      desc = "Remove line numbers from Lazygit buffer",
      callback = function()
        if LAZYGIT_BUFFER ~= nil then
          vim.api.nvim_buf_set_var(LAZYGIT_BUFFER, "number", false)
          vim.api.nvim_buf_set_var(LAZYGIT_BUFFER, "relativenumber", false)
        end
      end,
    })
  end,
}
