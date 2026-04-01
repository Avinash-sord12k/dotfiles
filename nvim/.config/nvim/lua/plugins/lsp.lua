return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(ev)
        local opts = function(desc)
          return { buffer = ev.buf, desc = desc }
        end

        vim.keymap.set("n", "<C-k>", vim.lsp.buf.hover, opts("Hover docs"))
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover docs"))
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Show references"))
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
      end,
    })

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "pyright",
        "lua_ls",
        "ts_ls",
        "eslint",
        "dockerls",
        "docker_compose_language_service",
        "yamlls",
        "bashls",
        "jsonls",
        "tailwindcss",
        "omnisharp"
      },
      automatic_enable = true,
    })

    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("*", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    })

    vim.lsp.config("lua_ls", {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    vim.lsp.config("tailwindcss", {
      capabilities = capabilities,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
      },
    })

    vim.lsp.config("ts_ls", {
      capabilities = capabilities,
      -- root_markers replaces lspconfig's root_dir function in the native API.
      -- Nearest ancestor with tsconfig.json wins → each monorepo package gets
      -- its own ts_ls instance. Falls back to package.json / .git.
      root_markers = { "tsconfig.json", "package.json", "jsconfig.json", ".git" },
      workspace_required = true, -- replaces single_file_support = false
    })

    vim.lsp.config("omnisharp", {
      capabilities = capabilities,
      filetypes = { "cs", "vb" },
      enable_roslyn_analyzers = true,
      organize_imports_on_format = true,
      enable_import_completion = true,
    })

    -- Explicitly enable servers so they attach even if automatic_enable is
    -- not supported by the installed mason-lspconfig version.
    local servers = {
      "ts_ls", "eslint", "lua_ls", "pyright",
      "dockerls", "docker_compose_language_service",
      "yamlls", "bashls", "jsonls", "tailwindcss", "omnisharp",
    }
    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end

  end,
}

