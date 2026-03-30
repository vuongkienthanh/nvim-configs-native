vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/antosha417/nvim-lsp-file-operations",
  "https://github.com/rafamadriz/friendly-snippets",
  { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
  "https://github.com/stevearc/conform.nvim",
})

require("lsp-file-operations").setup()
require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = { implementation = "prefer_rust_with_warning" },
})
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_fix", "ruff_format" },
    rust = { "rustfmt" },
  },
})
vim.keymap.set("n", "<leader>ff", function()
  require("conform").format({ lsp_format = "fallback" })
end)

local servers = {
  -- generic
  "taplo",
  "yamlls",
  "jsonls",
  "marksman",

  -- lua
  "lua_ls",

  -- web dev
  "html",
  "cssls",
  -- "eslint",
  "ts_ls",
  -- "svelte",

  -- python
  "basedpyright",
  -- "ruff",

  -- rust
  -- "rust_analyzer",
}

vim.lsp.enable(servers)

vim.diagnostic.config({
  virtual_text = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bmap = function(mode, km, ex)
      vim.api.nvim_buf_set_keymap(args.buf, mode, km, ex, { silent = true })
    end
    bmap("n", "grr", ":Telescope lsp_references<CR>")
    bmap("n", "grm", ":Telescope lsp_implementations<CR>")
    bmap("n", "<leader>d", ":lua vim.diagnostic.open_float()<CR>")
    bmap("n", "<leader>i", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>")
    bmap("n", "<leader>qq", ":lua require('telescope.builtin').diagnostics({bufnr=0, severity_limit=2})<CR>")
    bmap("n", "<leader>qa", ":Telescope diagnostics<CR>")
    -- :h lsp-defaults
    -- C-]: jump to definition
    -- C-t: jump back
    -- K: hover
    -- grn: rename
    -- gra: code action
    -- grr: references
    -- i_C-s: signature help
  end,
})
