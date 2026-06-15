vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "telescope-fzf-native.nvim" and kind == "install" then
      if vim.fn.has("win32") then
        vim.system(
          {
            "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release; if ($?) {cmake --build build --config Release --target install}",
          },
          { cwd = ev.data.path }
        )
      else
        vim.system({ "make" }, { cwd = ev.data.path })
      end
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/pteroctopus/faster.nvim",
})

require("faster").setup()
