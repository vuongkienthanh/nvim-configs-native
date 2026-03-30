vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim", version = vim.version.range("*") },
  "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
})

require("telescope").setup({
  defaults = {
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
      },
    },
    initial_mode = "normal",
    scroll_strategy = "limit",
    preview = {
      filesize_limit = 0.1, -- MB
      treesitter = false,
    },
    file_ignore_patterns = {
      "%.lock",
      "nvim%-pack%-lock%.json",
    },
  },
  pickers = {
    live_grep = {
      initial_mode = "insert",
    },
    builtin = {
      previewer = false,
    },
  },
})
require("telescope").load_extension("fzf")

local map = function(km, ex)
  vim.keymap.set("n", km, ex, { silent = true })
end

map("<leader>fp", ":Telescope builtin<CR>")
map("<leader>fg", ":Telescope live_grep<CR>")
map("<leader>fb", ":Telescope buffers<CR>")
