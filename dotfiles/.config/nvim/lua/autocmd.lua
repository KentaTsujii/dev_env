local onstart_group = vim.api.nvim_create_augroup('cd-on-start', { clear = true })
local rec_path = vim.api.nvim_call_function('expand', {'%'})
local full_path = vim.api.nvim_call_function('substitute', {rec_path, '.*file:\\/\\/\\|\\$$', "", "g"})
local dir_name = vim.api.nvim_call_function('fnamemodify', {full_path, ':p:h'} )

vim.api.nvim_create_autocmd({ 'VimEnter' }, {
  pattern = '*',
  group = onstart_group,
  command = string.format(':cd %s', dir_name)
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<C-t>', '<CMD>exe v:count . "ToggleTerm"<CR>', {silent = true, buffer = 0})
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.api.nvim_create_autocmd({'TermEnter'}, {
  pattern = 'term://*toggleterm#*',
  callback = set_terminal_keymaps
})

