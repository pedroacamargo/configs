-- Set the mappings for Tmux navigation
vim.keymap.set('n', '<leader>l', vim.cmd.TmuxNavigateRight)
vim.keymap.set('n', '<leader>h', vim.cmd.TmuxNavigateLeft)
vim.keymap.set('n', '<leader>k', vim.cmd.TmuxNavigateUp)
vim.keymap.set('n', '<leader>j', vim.cmd.TmuxNavigatePrevious)
