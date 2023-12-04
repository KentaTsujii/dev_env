--LSP関連の設定
--プラグイン設定
require('mason').setup {
  ensure_installed = {
    "flake8",
    "isort",
    "markdownlint-cli"
  }
}

require('mason-lspconfig').setup {
  ensure_installed = {
    "lua_ls",
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
      markdown = {
        {
          lintIgnoreExitCode = true,
          lintStdin = true,
          lintCommand = "markdownlint -s",
          lintFormats = { "%f:%l %m", "%f:%l:%c %m, %f: %l: %m" },
        },
      },
      python = {
        {
          lintCommand = 'flake8 --stdin-display-name ${INPUT} -',
          lintStdin = true,
          lintFormats = { '%f:%l:%c: %m' },
        },
        {
          formatCommand = 'isort -',
          formatStdin = true
        }
      }
    },
  },
  filetypes = {
    "markdown", "python"
  },
})

---- 保存時にlinterが動くように設定
vim.api.nvim_exec([[
  autocmd BufWrite * lua vim.lsp.buf.format({async=false})
]], false)
