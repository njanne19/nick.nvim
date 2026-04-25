return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "clangd", "pyright", "rust_analyzer", "lua_ls" },
                automatic_installation = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = { "williamboman/mason-lspconfig.nvim" },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            vim.lsp.config("clangd", { capabilities  = capabilities })
            vim.lsp.config("pyright", { capabilities  = capabilities })
            vim.lsp.config("rust_analyzer", { capabilities  = capabilities })
            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = {
                            globals = { "vim" },
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    },
                },
            })
            vim.lsp.enable({ "clangd", "pyright", "rust_analyzer", "lua_ls" })
            
            -- Keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                callback = function(args)
                    local opts = { buffer = args.buf }
                    vim.keymap.set("n", "gd",           vim.lsp.buf.definition,     opts)
                    vim.keymap.set("n", "gD",           vim.lsp.buf.declaration,    opts)
                    vim.keymap.set("n", "gr",           vim.lsp.buf.references,     opts)
                    vim.keymap.set("n", "gi",           vim.lsp.buf.implementation, opts)
                    vim.keymap.set("n", "K",            vim.lsp.buf.hover,          opts)
                    vim.keymap.set("n", "<leader>rn",   vim.lsp.buf.rename,         opts)
                    vim.keymap.set("n", "<leader>ca",   vim.lsp.buf.code_action,    opts)
                    vim.keymap.set("n", "<leader>d", function() vim.diagnostic.open_float() end, opts)
                    vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
                    vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
                end,
            })
        end,
    }
}
