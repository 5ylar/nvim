return function(use)
    -------
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        }
    }
    require("nvim-tree").setup({
        git = {
            enable = true,
            ignore = false,
            show_on_dirs = true,
            show_on_open_dirs = true,
            timeout = 400,
        },
        modified = {
            enable = true,
            show_on_dirs = true,
            show_on_open_dirs = true,
        },
    })
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
end
