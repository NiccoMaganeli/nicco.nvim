return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {},
  keys = {
    {
      "<leader>lg",
      function()
        vim.cmd("Neogit")
      end,
      desc = "Open Neogit",
    },
  },
}
