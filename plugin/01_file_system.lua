vim.pack.add({
  {
    src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
    version = "v3.x",
  },
})
vim.keymap.set("n", "<leader><tab>", ":Neotree toggle<CR>")
require("neo-tree").setup({
  filesystem = {
    hijack_netrw_behavior = "open_default", 
  }
})
