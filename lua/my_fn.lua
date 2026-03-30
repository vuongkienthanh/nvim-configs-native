vim.api.nvim_create_user_command("PackList", function()
  print("Enabled:")
  for _, p in ipairs(vim.pack.get()) do
    if p.active then
      print(p.spec.name)
    end
  end
  print("\nDisabled:")
  for _, p in ipairs(vim.pack.get()) do
    if not p.active then
      print(p.spec.name)
    end
  end
end, {})

vim.api.nvim_create_user_command("PackClean", function()
  vim.pack.del(vim
    .iter(vim.pack.get())
    :filter(function(x)
      return not x.active
    end)
    :map(function(x)
      return x.spec.name
    end)
    :totable())
end, {})

vim.api.nvim_create_user_command("PackUpdate", function()
  vim.pack.update()
end, {})
