return function(use)
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    local telescope_actions = require("telescope.actions")

    require('telescope').setup {
        defaults = {
            -- Default configuration for telescope goes here:
            -- config_key = value,
            mappings = {
                i = {
                    -- map actions.which_key to <C-h> (default: <C-/>)
                    -- actions.which_key shows the mappings for your picker,
                    -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                    ["<C-h>"] = "which_key",
                    ["<C-d>"] = telescope_actions.delete_buffer,
                }
            }
        },
        pickers = {
            -- Default configuration for builtin pickers goes here:
            -- picker_name = {
            --   picker_config_key = value,
            --   ...
            -- }
            -- Now the picker_config_key will be applied every time you call this
            -- builtin picker
        },
        extensions = {
            -- Your extension configuration goes here:
            -- extension_name = {
            --   extension_config_key = value,
            -- }
            -- please take a look at the readme of the extension you want to configure
        }
    }

    vim.keymap.set("n", "<leader>p", ":Telescope find_files<CR>")
    vim.keymap.set("n", "<leader>s", ":Telescope live_grep<CR>")
    vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<CR>")
    vim.keymap.set("n", "<leader><Tab>", ":Telescope buffers<CR>")
end

