-- LeaderキーをSpaceに設定(これだけでは意味をなさない)
vim.g.mapleader = " "

-- ターミナルを開く関数
_G.open_term = function()
    vim.cmd('split')
    vim.cmd('wincmd j')
    vim.cmd('resize 10')
    vim.cmd('terminal')
    vim.cmd('wincmd k')
end

-- ターミナル起動
vim.keymap.set('n', '<S-t>', ':lua open_term()<CR>', {noremap = true, silent = true})

-- ターミナルを終了
vim.keymap.set('t', '<C-t>', '<C-\\><C-n><C-w>q', {noremap = true, silent = true})

--上のエディタウィンドウと下のターミナルウィンドウ(ターミナル挿入モード)を行き来
--コマンドウィンドウに移動
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', {noremap = true, silent = true})
--エディタウィンドウに移動
vim.keymap.set('n', '<S-j>', '<C-w>ji', {noremap = true, silent = true})

vim.keymap.set('n', '<C-n>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>')
vim.keymap.set('n', '<S-h>', '<C-w>h')
vim.keymap.set('n', '<S-l>', '<C-w>l')

vim.keymap.set('i', '<C-l>', '<ESC>')

