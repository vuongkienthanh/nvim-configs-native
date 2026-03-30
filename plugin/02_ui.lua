vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })
vim.cmd.colorscheme("kanagawa-dragon")

vim.pack.add({ { src = "https://github.com/lukas-reineke/indent-blankline.nvim", name = "ibl" } })
require("ibl").setup()

vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })
require("lualine").setup({
  options = {
    theme = "jellybeans",
  },
  sections = {
    lualine_c = { { "filename", path = 1 }, "filesize" },
  },
})
