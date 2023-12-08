-- LeaderキーをSpaceに設定(これだけでは意味をなさない)
vim.g.mapleader = " "

--上のエディタウィンドウと下のターミナルウィンドウ(ターミナル挿入モード)を行き来
--エディタウィンドウに移動
vim.keymap.set('n', '<S-j>', '<C-w>ji', { noremap = true, silent = true })

vim.keymap.set('n', '<C-n>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>', { silent = true })
vim.keymap.set('n', '<S-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<S-l>', '<C-w>l', { silent = true })

vim.keymap.set('i', '<C-l>', '<ESC>', { silent = true })

-- 検索系
vim.keymap.set('n', '<C-p>', '<CMD>Telescope find_files<CR>', { silent = true })
vim.keymap.set('n', '<C-b>', '<CMD>Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<C-f>', '<CMD>Telescope live_grep<Cr>', { silent = true })

vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.format()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
