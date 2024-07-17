return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
  opts = {
    load = {
      ["core.concealer"] = {},
      ["core.defaults"] = {},
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
      ["core.dirman"] = {
        config = {
          workspaces = {
            notes = "~/notes",
          },
          default_workspace = "notes",
        },
      },
      ["core.export"] = {},
    },
  },
  init = function()
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
