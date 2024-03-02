local mode = {'n', 'o', 'x'}
vim.keymap.set(mode, 'h', 'n', {noremap = true})
vim.keymap.set(mode, 'n', 'j', {})
vim.keymap.set(mode, 'e', 'k', {})
-- To enter the insert mode
vim.keymap.set(mode, 'I', 'i', {})
