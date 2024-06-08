return {
  "diegoulloao/neofusion.nvim",
  priority = 1000,
  init = function()
    vim.o.background = "dark"
    vim.g.current_colorscheme = "neofusion"
    vim.cmd.colorscheme(vim.g.current_colorscheme)
  end,
  opts = {
    transparent_mode = true,
    italic = {
      comments = false,
    },
    palette_overrides = {
      gray = "#337CA6",
      dark4 = "#0E76A6",
    },
  },
}
