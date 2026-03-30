vim.api.nvim_create_autocmd('PackChanged', {callback =function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'telescope-fzf-native.nvim' and kind == 'install' then
        vim.system({'make'}, {cwd = ev.data.path }) 
    end
    if name == 'nvim-treesitter' and kind == 'update' then
        if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
        vim.cmd('TSUpdate')
    end
end})

vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/pteroctopus/faster.nvim",
})

require('faster').setup()
