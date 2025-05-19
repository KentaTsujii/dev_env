--LSP関連の設定
--プラグイン設定
require('mason').setup {
  ensure_installed = {
    "flake8",
    "isort",
    "markdownlint-cli",
    "sqlfluff",
    "yamllint"
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
local sqlfluff_lint = require('efmls-configs.linters.sqlfluff')
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
      },
      sql = { sqlfluff_lint },
      yaml = { -- yamllint の設定を追加
        {
          lintCommand = "yamllint -f parsable -c .yamllint -",
          lintStdin = true,
          lintFormats = { "%f:%l:%c: %m" },
        },
      }
    },
  },
  filetypes = {
    "markdown", "python", "sql", "yaml"
  },
})

lspconfig.rust_analyzer.setup({
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
})

---- 保存時にlinterが動くように設定
vim.api.nvim_exec([[
  autocmd BufWrite * lua vim.lsp.buf.format({async=false})
]], false)
