-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>en', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '<leader>ep', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', 'F8', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>E', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set('n', '<leader>q', ':q<CR>', {desc = 'Quit without saving'})
vim.keymap.set('n', '<leader>Q', ':wq<CR>', {desc = 'Save & Quit'})

-- More involved keymappings here, essentially replacing few of the common plugins in vscode by myself

vim.keymap.set('n', '<A-S-l>', function()
	local curr_word = vim.fn.expand("<cword>")
	-- local curr_file = vim.fn.expand("%:p")
	local curr_file = vim.api.nvim_buf_get_name(0)
	local console_command = string.format("console.log('%s ~ %s', %s)", curr_file, curr_word, curr_word)
	local curr_line = vim.fn.line(".")
	vim.fn.append(curr_line, console_command)
end, {})

vim.keymap.set('n', '<A-S-d>', ":g/console.log(.*)/d<CR>", { desc = 'Delete all console logs in the file' })
vim.keymap.set('n', '<A-S-f>', ":Format<CR>", { desc = 'Format the whole file' })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-m>', "gcc", { desc = "Comment the line or selection" }) -- dont know why not worki
vim.keymap.set('n', '<C-b>', ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set('n', '<C-S-b>', ":Vex<CR>", { desc = "Toggle NvimTree" })
vim.keymap.set('n', '<C-S-o>', '<C-S-i>', { desc = "Jump forward in the list" })
vim.keymap.set('n', '<leader><tab>', '<C-W>w', { desc = 'Jump Alternate files' })
vim.keymap.set('n', '<leader>b', ':e#<CR>', { desc = 'Jump Alternate files' })
vim.api.nvim_create_user_command('Reload', 'so ' .. vim.fn.expand('$HOME/.config/nvim/init.lua'), {})
vim.api.nvim_create_user_command('OpenSettings', 'e ' .. vim.fn.expand('$HOME/.config/nvim/init.lua'), {})
