--LSP関連の設定
--プラグイン設定
require('mason').setup {
  ensure_installed = {
    "flake8",
    "isort",
    "markdownlint-cli2"
  }
}

require('mason-lspconfig').setup {
  ensure_installed = {
    "lua_ls",
    "pyright",
    "efm"
  }
}

require('mason-lspconfig').setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {}
  end
}

local lspconfig = require('lspconfig')
lspconfig.efm.setup({
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  settings = {
    rootMarkers = {
      ".git/",
    },
    languages = {
      python = {
        --{
        --  formatCommand = "/home/ubuntu/.local/share/nvim/mason/bin/isort --quiet -"
        --},
        {
          lintCommand = "/home/ubuntu/.local/share/nvim/mason/bin/flake8 --format=%(path)s:%(row)d:%(col)d:%(code)s:%(text)s --stdin-display-name ${INPUT} -"
        }
      },
      markdown = {
        {
          lintCommand = "/home/ubuntu/.local/share/nvim/mason/bin/markdownlint-cli2 ${INPUT}",
          lintFormats = { "%f:%l %m" },
        },
      },
    },
  },
  filetypes = {
    "markdown",
    "python"
  },
})

-- 保存時にlinterが動くように設定
vim.api.nvim_exec([[
  autocmd BufWrite * lua vim.lsp.buf.format({async=false})
]], false)

