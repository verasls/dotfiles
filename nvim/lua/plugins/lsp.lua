return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "j-hui/fidget.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "ts_ls",
        "eslint",
        "lua_ls",
        "r_language_server",
      },
      handlers = {
        function(server_name) -- Default handler
          require("lspconfig")[server_name].setup {
            capabilities = capabilities,
          }
        end,

        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                }
              }
            }
          }
        end,
      },
    })

    require("lspconfig").sourcekit.setup({
      capabilities = capabilities,
      cmd = { "sourcekit-lsp" },
      filetypes = { "swift", "objective-c", "objective-cpp" },
      root_dir = function(fname)
        return require("lspconfig").util.root_pattern("*.xcodeproj", "*.xcworkspace", ".git")(fname)
            or vim.fn.getcwd()
      end,
    })


    require("lspconfig").tailwindcss.setup({
      settings = {
        tailwindCSS = {
          experimental = {
            classRegex = {
              { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" },
              { "cn\\(([^)]*)\\)",  "[\"'`]([^\"'`]*).*?[\"'`]" },
              { "cn\\(([^)]*)\\)",  "(?:'|\"|`)([^'\"`]+)(?:'|\"|`)" },
            },
          },
        },
      },
    })

    -- Configure tsserver with path alias support
    require("lspconfig").ts_ls.setup({
      capabilities = capabilities,
      on_attach = function(client)
        client.server_capabilities.documentFormattingProvider = true
        client.server_capabilities.documentRangeFormattingProvider = true
      end,
      on_new_config = function(new_config)
        new_config.init_options = new_config.init_options or {}
        new_config.init_options.preferences = new_config.init_options.preferences or {}
        new_config.init_options.preferences.importModuleSpecifierPreference = "non-relative"
      end,
      settings = {
        typescript = {
          preferences = {
            importModuleSpecifierPreference = "non-relative",
          },
        },
        javascript = {
          preferences = {
            importModuleSpecifierPreference = "non-relative",
          },
        },
      },
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }, {
        { name = "buffer" },
        { name = "path" }
      })
    })

    vim.diagnostic.config({
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })

    -- Use LspAttach autocommand to map keys after LSP attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "dh", ":split | lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "dv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
      end,
    })

    -- ESLint fix on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
      command = "EslintFixAll"
    })
  end
}
