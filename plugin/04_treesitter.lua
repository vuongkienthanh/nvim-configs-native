vim.pack.add({
  "https://github.com/romus204/tree-sitter-manager.nvim",
  { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
})

require("tree-sitter-manager").setup()
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = {
      ["@function.outer"] = "V",
      ["@class.outer"] = "V",
      ["@call.outer"] = "V",
      ["@conditional.outer"] = "V",
      ["@loop.outer"] = "V",
    },
    include_surrounding_whitespace = false,
  },
})

-- text obj
-- Disable entire built-in ftplugin mappings to avoid conflicts.
vim.g.no_plugin_maps = true
local map = function(km, ex)
  vim.keymap.set({ "x", "o" }, km, function()
    require("nvim-treesitter-textobjects.select").select_textobject(ex, "textobjects")
  end, { buffer = true })
end

-- features
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "python", "rust", "html", "css", "javascript", "typescript", "json", "toml" },
  callback = function()
    -- highlighting
    vim.treesitter.start()
    -- text obj
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
  end,
})

