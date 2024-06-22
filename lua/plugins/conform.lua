local function format_with_conform()
  require("conform").format({ async = true, lsp_fallback = true })
end

return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      format_with_conform,
      mode = "",
      desc = "Format buffer",
    },
    {
      "<F3>",
      format_with_conform,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "black" },
      elm = { "elm-format" },
    },
  },
}
