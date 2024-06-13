return {
  "VonHeikemen/lsp-zero.nvim",
  branch = "v3.x",
  dependencies = {
    "neovim/nvim-lspconfig",
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("my-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        local telescope_builtin = require("telescope.builtin")
        map("gd", telescope_builtin.lsp_definitions, "Goto definition")
        map("gD", vim.lsp.buf.declaration, "Goto declaration")
        map("gr", telescope_builtin.lsp_references, "Goto references")
        map("gI", telescope_builtin.lsp_implementations, "Goto implementation")
        map("<leader>D", telescope_builtin.lsp_type_definitions, "Current variable type definition")
        map("<leader>ds", telescope_builtin.lsp_document_symbols, "Search document symbols")
        map("<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols, "Search workspace symbols")
        map("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<leader>ca", vim.lsp.buf.code_action, "Code action")

        -- NOTE: This is just highlighting whatever is under cursor, if cursor is there for a while
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup("my-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("my-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "my-lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          map("<leader>th", function()
            ---@diagnostic disable-next-line: missing-parameter
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, "Toggle inlay hints")
        end
      end,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
            diagnostics = {
              disable = { "missing-fields" },
            },
          },
        },
      },
      tsserver = {},
      bashls = {},
      marksman = {},
      helm_ls = {},
      yamlls = {},
      jsonls = {},
      gopls = {},
      pylsp = {},
    }

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "stylua",
      "black",
    })

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

    local lsp_zero = require("lsp-zero")
    lsp_zero.extend_lspconfig()

    lsp_zero.on_attach(function(_, bufnr)
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    local lsp_config = require("lspconfig")
    require("mason-lspconfig").setup({
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          lsp_config[server_name].setup(server)
        end,
      },
    })

    lsp_zero.setup()
  end,
}
