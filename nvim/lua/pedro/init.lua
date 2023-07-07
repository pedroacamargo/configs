require("pedro.remap")
require("pedro.set")

vim.api.nvim_command('set termguicolors')
vim.api.nvim_command('set t_Co=256')

-- Colorscheme:
vim.g.adwaita_darker = true -- for darker version
vim.g.adwaita_disable_cursorline = true -- to disable cursorline
vim.g.adwaita_transparent = true-- makes the background transparent
vim.cmd([[colorscheme adwaita]])

vim.g.airline_theme = 'selenized'

-- Tree sitter:
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

-- Create a directory in the current folder path
function _G.create_directory()
    local current_file = vim.fn.expand('%:p:h')
    local directory_name = vim.fn.input('Enter directory name: ')
    local directory_path = current_file .. '/' .. directory_name
    vim.fn.mkdir(directory_path, 'p')
    vim.cmd('edit ' .. directory_path)
end
vim.cmd('command! CreateDirectory lua create_directory()')
vim.keymap.set('n','<leader>dd',vim.cmd.CreateDirectory)

-- Mini move
-- No need to copy this inside `setup()`. Will be used automatically.
require('mini.move').setup({
  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
    left = '<M-Left>',
    right = '<M-Right>',
    down = '<M-Down>',
    up = '<M-Up>',

    -- Move current line in Normal mode
    line_left = '<M-Left>',
    line_right = '<M-Right>',
    line_down = '<M-Down>',
    line_up = '<M-Up>',
  },

  -- Options which control moving behavior
  options = {
    -- Automatically reindent selection during linewise vertical move
    reindent_linewise = true,
  },
})


require('nvim_comment').setup()
