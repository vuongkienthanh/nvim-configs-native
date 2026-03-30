vim.g.no_plugin_maps = true
vim.pack.add({
  "https://github.com/nvim-treesitter/nvim-treesitter",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})

-- features
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "rust", "html", "css", "javascript", "typescript", "json", "toml" },
  callback = function()
    -- highlighting
    vim.treesitter.start()
    -- indentation
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- textobj
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = {
      ["@class.outer"] = "V",
      ["@function.outer"] = "V",
      ["@conditional.outer"] = "V",
      ["@loop.outer"] = "V",
    },
    include_surrounding_whitespace = false,
  },
})
local map = function(km, ex)
  vim.keymap.set("n", km, function()
    require("nvim-treesitter-textobjects.select").select_textobject(ex, "textobjects")
  end, { silent = true })
end

map("af", "@function.outer")
map("if", "@function.inner")
map("ac", "@class.outer")
map("ic", "@class.inner")
map("am", "@call.outer")
map("im", "@call.inner")
map("ao", "@conditional.outer")
map("io", "@conditional.inner")
map("al", "@loop.outer")
map("il", "@loop.inner")
