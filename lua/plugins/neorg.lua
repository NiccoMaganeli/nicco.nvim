return {
  "nvim-neorg/neorg",
  lazy = false,
  version = "*",
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
      ["core.completion"] = {
        config = {
          engine = "nvim-cmp",
        },
      },
    },
  },
  init = function()
    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
