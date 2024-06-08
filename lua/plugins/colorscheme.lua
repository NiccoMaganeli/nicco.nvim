return {
  "rose-pine/nvim",
  name = "rose-pine",
  priority = 1000,
  init = function()
    vim.o.background = "dark"
    vim.g.current_colorscheme = "rose-pine"
    vim.cmd.colorscheme(vim.g.current_colorscheme)
  end,
  opts = {
    styles = {
      italic = false,
      transparency = true,
    },
  },
}
