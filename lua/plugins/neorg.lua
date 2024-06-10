return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  dependencies = {
    {
      "vhyrro/luarocks.nvim",
      priority = 1000,
      opts = {},
    },
  },
  opts = {
    load = {
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes",
        },
      },
    },
  },
  init = function()
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
