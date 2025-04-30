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

-- adapted from https://github.com/kaiguogit/my-configs/blob/master/nvim/lua/config/keymaps.lua
local find_file = function()
    local file_list = {}
    local list = vim.fn.glob(vim.fn.expand("%:p:h") .. "/*", true, true)
    local found_cur_file = false
    local file_idx = 0
    local count = 0;
    for k, file_path in pairs(list) do
        local filename = vim.fs.basename(file_path)
        local is_file = string.find(filename, '%.')
        local is_same = filename == vim.fn.expand("%:t")
        if is_file then
            table.insert(file_list, filename)
            count = count + 1
        end
        if is_same and is_file then
            found_cur_file = true
            file_idx = count
        end
    end
	return {count =count, file_list = file_list, found_cur_file = found_cur_file, file_idx= file_idx}
end
local open_next_file = function(opt)
	local next_file_path
	local r = find_file()
    print('Opening next file')
    if r.found_cur_file then
		if opt and opt.reverse then
			if r.file_idx == 1 then
				next_file_path = r.file_list[r.count]
			else
				next_file_path = r.file_list[r.file_idx - 1]
			end
		else
			if r.file_idx == r.count then
				next_file_path = r.file_list[1]
			else
				next_file_path = r.file_list[r.file_idx + 1]
			end
		end
    end
	if next_file_path then
		vim.cmd('e ' .. vim.fn.expand("%:p:h") .. '/' .. next_file_path)
	end

end

-- vim.keymap.set("n", "<A-n>", function ()
vim.keymap.set("n", "<A-,>", function ()
    print('opening next file -- reverse')
	open_next_file({reverse = true})
end, {})
-- vim.keymap.set("n", "<A-m>", open_next_file)
vim.keymap.set("n", "<A-.>", open_next_file)
