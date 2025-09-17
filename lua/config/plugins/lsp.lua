return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    { "saghen/blink.cmp", },
    {
      "mason-org/mason.nvim",
      opts = {},
      config = function()
        require("mason").setup {
          registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
          },
        }
      end
    },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("lua_ls", { capabilities = capabilities })
    vim.lsp.config("ts_ls", { capabilities = capabilities })
    vim.lsp.config("clangd", { capabilities = capabilities })
    vim.lsp.config("basedpyright", {
      capabilities = capabilities,
      settings = {
        basedpyright = {
          analysis = {
            typeCheckingMode = "basic",
          }
        }
      }
    })
    vim.lsp.config("html", { capabilities = capabilities })
    vim.lsp.config("roslyn", { capabilities = capabilities })

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("ts_ls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("basedpyright")
    vim.lsp.enable("html")
    vim.lsp.enable("roslyn")

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
      callback = function(e)
        local opts = { buffer = e.buf }

        vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set('n', '<leader>vqd', function() vim.diagnostic.setqflist() end, opts)
        vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true}) end, opts)
        vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true}) end, opts)
        vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set('n', '<leader>lre', function() vim.lsp.buf.references() end, opts)
        vim.keymap.set('n', '<leader>lrn', function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
      end,
    })
  end,
}

