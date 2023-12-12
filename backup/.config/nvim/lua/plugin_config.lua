vim.cmd [[colorscheme hybrid]]

--toggleterm 設定
require('toggleterm').setup()
-- ターミナル起動
vim.keymap.set('n', '<C-t>', '<CMD>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
vim.keymap.set('i', '<C-t>', '<ESC>exe v:count1 . "ToggleTerm"<CR>', { silent = true })
vim.keymap.set('v', '<C-t>', ':ToggleTermSendVisualSelection<CR>', { silent = true })

-- lazygit ターミナル設定
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  hidden = true
})
local snowsql = Terminal:new({
  cmd = "snowsql",
  direction = "float",
  hidden = true
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _snowsql_toggle()
  snowsql:toggle()
end

vim.api.nvim_set_keymap("n", "lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "sq", "<cmd>lua _snowsql_toggle()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>s", "<cmd>lua _snowsql_toggle()<CR>", { noremap = true, silent = true })

-- fern 設定
vim.g['fern#default_hidden'] = 1

-- telescope 設定
require('telescope').setup {
  pickers = {
    find_files = {
      hidden = true
    }
  }
}

