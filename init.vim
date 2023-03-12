vim.g.mapleader = " "
vim.opt.nu = true
vim.opt.relativenumber = true

if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    vim.keymap.set("n","<leader>w","<cmd>:w<CR>")
    vim.keymap.set("n","<leader>q","<cmd>:q<CR>")
end
