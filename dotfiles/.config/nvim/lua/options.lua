local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  backup = false,
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  hlsearch = true,
  ignorecase = true,
  mouse = "a",
  pumheight = 10,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 300,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  shell = "zsh",
  backupskip = { "/tmp/*", "/private/tmp/*" },
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = false,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = false,
  winblend = 0,
  wildoptions = "pum",
  pumblend = 5,
  background = "dark",
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",
  splitbelow = false, -- オンのとき、ウィンドウを横分割すると新しいウィンドウはカレントウィンドウの下に開かれる
  splitright = false, -- オンのとき、ウィンドウを縦分割すると新しいウィンドウはカレントウィンドウの右に開かれる
  hidden = true,
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- ハイライト設定
--vim.cmd [[
--set updatetime=500
--highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
--highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
--highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
--augroup lsp_document_highlight
--  autocmd!
--  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
--  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
--augroup END
--]]
