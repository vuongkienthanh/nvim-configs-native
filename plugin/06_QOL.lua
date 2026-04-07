vim.pack.add({
  {
    src = "https://github.com/kylechui/nvim-surround",
    version = vim.version.range("^4.0.0"),
  },
  "https://github.com/windwp/nvim-autopairs",
  "https://codeberg.org/andyg/leap.nvim",
  "https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
})

require("nvim-autopairs").setup()
require("nvim-surround").setup()
vim.keymap.set("n", "<leader>s", "<Plug>(leap)")


require('ts_context_commentstring').setup {
  enable_autocmd = false,
}
local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  return option == "commentstring"
    and require("ts_context_commentstring.internal").calculate_commentstring()
    or get_option(filetype, option)
end