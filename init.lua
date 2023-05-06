------------- GENERAL -------------

vim.opt.guicursor = ""

vim.opt.nu = true

vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.config/nvim/.cache/backupdir"
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/.cache/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.opt.ttyfast = true
vim.opt.cursorline = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.spell = true
vim.opt.spelllang = "en_us"
vim.opt.encoding = "UTF-8"

------------- RE-MAPPINGS - 1 -------------

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "r", "\"_r")
vim.keymap.set("n", "c", "\"_c")
vim.keymap.set("n", "d", "\"_d")
vim.keymap.set("n", "D", "\"_D")
vim.keymap.set("n", "s", "\"_s")
vim.keymap.set("n", "S", "\"_S")
vim.keymap.set("v", "r", "\"_r")
vim.keymap.set("v", "c", "\"_c")
vim.keymap.set("v", "d", "\"_d")
vim.keymap.set("v", "D", "\"_D")
vim.keymap.set("v", "s", "\"_s")
vim.keymap.set("v", "S", "\"_S")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])


-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- vim.keymap.set("x", "<leader>p", [["_dP]])


vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("v", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<C-q>", ":q<CR>")
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>")

vim.cmd [[hi DiffAdd      gui=none    guifg=NONE          guibg=#bada9f]]
vim.cmd [[hi DiffChange   gui=none    guifg=NONE          guibg=#e5d5ac]]
vim.cmd [[hi DiffDelete   gui=bold    guifg=#ff8080       guibg=#ffb0b0]]
vim.cmd [[hi DiffText     gui=none    guifg=NONE          guibg=#8cbee2]]

-- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white ]]

------------- PLUGINS -------------

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -------

    require('plugins/bufferline')(use)
    require('plugins/comment')(use)
    require('plugins/filetree')(use)
    require('plugins/git')(use)
    require('plugins/lsp')(use)
    require('plugins/notification')(use)
    require('plugins/telescope')(use)
    require('plugins/theme')(use)
    require('plugins/treesitter')(use)

    -------
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

--- xx
