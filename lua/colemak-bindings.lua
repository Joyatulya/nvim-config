local mode = {'n', 'o', 'x'}
vim.keymap.set(mode, 'h', 'n', {noremap = true})
vim.keymap.set(mode, 'n', 'j', {})
vim.keymap.set(mode, 'e', 'k', {})
vim.keymap.set(mode, 'm', 'h', {})
vim.keymap.set(mode, 'M', 'H', {})
-- To enter the insert mode
vim.keymap.set(mode, 'I', 'i', {})
