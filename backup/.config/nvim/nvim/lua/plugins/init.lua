return {
  'lambdalisue/fern.vim',
  'lambdalisue/fern-git-status.vim',
  'nvim-lua/plenary.nvim',
  'nvim-treesitter/nvim-treesitter',
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/vim-vsnip",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "creativenull/efmls-configs-nvim",
  "w0ng/vim-hybrid",
  {
    'simrat39/rust-tools.nvim',
    ft = { 'rust' },           -- Rust ファイルでのみ読み込む
    requires = {
      'neovim/nvim-lspconfig', -- LSP設定の依存関係
    },
    config = function()
      require('rust-tools').setup({
        server = {
          settings = {
            ["rust-analyzer"] = {
              assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self",
              },
              cargo = {
                loadOutDirsFromCheck = true,
              },
              procMacro = {
                enable = true,
              },
            }
          }
        }
      })
    end
  }
}
