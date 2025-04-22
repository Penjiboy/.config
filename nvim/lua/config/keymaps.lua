-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")

-- paste without changing the buffer
vim.keymap.set("x", "<leader>p", '"_dP')

-- copy into system clipboard (+)
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Delete to void register
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

vim.keymap.set("n", "Q", "<nop>")

-- Added these to whichkey.lua instead
-- Diagnostics
-- vim.keymap.set("n", "<leader>xh", function() vim.diagnostic.hide() end)
-- vim.keymap.set("n", "<leader>xs", function() vim.diagnostic.show() end)

-- Git script to show log at lines
vim.keymap.set("v", "<leader>gl", function()
    local cur_file_path = vim.fn.expand("%:p")
    local command = vim.fn.escape('term git log --pretty="tformat:%n%n**(%cs) %Cblue%h%Creset %s" -L', '%')
    -- vim.cmd.vsplit();

    vim.cmd(
        command
            .. vim.fn.line("v")
            .. ","
            ..vim.fn.line(".")
            .. ":"
            .. cur_file_path
    )
end, {})

vim.keymap.set("n", "<leader>gl", function()
    local command = vim.fn.escape('term git log --pretty="tformat:%n%n**(%cs) %Cblue%h%Creset %s" -L', '%')

    vim.cmd(
        command
            .. math.max(1, vim.fn.line(".") - 1)
            .. ","
            .. vim.fn.line(".") + 1
            .. ":"
            .. vim.fn.expand("%:p")
    )
end, {})
