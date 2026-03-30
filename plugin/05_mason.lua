vim.pack.add( {
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
})
require("mason").setup()
require('mason-tool-installer').setup {
  ensure_installed = {
                -- generic
                "taplo",
                "yaml-language-server",
                "json-lsp",
                "marksman",

                -- lua
                "lua-language-server",
                "stylua", -- formatter

                -- web dev
                "html-lsp",
                "css-lsp",
                -- "eslint-lsp",
                "typescript-language-server",
                -- "svelte-language-server",

                -- python
                "basedpyright",
                "ruff", -- formatter

                -- rust
                -- "rust-analyzer",
  },
  run_on_start = false,
  integrations = {
    ['mason-lspconfig'] = false,
    ['mason-null-ls'] = false,
    ['mason-nvim-dap'] = false,
  },
}
