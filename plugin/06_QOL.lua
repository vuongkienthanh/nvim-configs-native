vim.pack.add({
  {
    src = "https://github.com/kylechui/nvim-surround",
    version = vim.version.range("^4.0.0"),
  },
  "https://github.com/windwp/nvim-autopairs",
  "https://codeberg.org/andyg/leap.nvim",
  "https://github.com/folke/ts-comments.nvim",
})

require("nvim-autopairs").setup()
require("nvim-surround").setup()
vim.keymap.set("n", "<leader>s", "<Plug>(leap)")
