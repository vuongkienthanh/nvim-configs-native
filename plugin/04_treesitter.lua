vim.pack.add({
    'https://github.com/nvim-treesitter/nvim-treesitter'
})

-- highlighting
vim.api.nvim_create_autocmd('FileType', {
  pattern ={'lua', 'python', 'rust', 'html', 'css', 'javascript', 'typescript', 'json', 'toml'} , 
  callback = function() vim.treesitter.start() end,
})
