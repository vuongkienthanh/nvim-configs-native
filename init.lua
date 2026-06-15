vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

if vim.fn.has("win32") == 1 then
  vim.g.python3_host_prog = "C:\\Users\\"
    .. vim.env.USERNAME
    .. "\\AppData\\Local\\Programs\\Python\\Python314\\python.exe"
  -- Use 'pwsh' (PowerShell 7+) instead of 'powershell' (5.1)
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
else
  vim.g.python3_host_prog = "/usr/bin/python3"
  if vim.fn.has("wsl") == 1 then
    vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
      cache_enabled = 0,
    }
  end
end

require("general")
require("keymaps")
require("my_fn")
