vim.pack.add({ "https://github.com/linux-cultist/venv-selector.nvim" })

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "python" },
  callback = function()
    vim.keymap.set("n", "<leader>v", "<cmd>VenvSelect<cr>", { buf = 0 })
  end,
})
