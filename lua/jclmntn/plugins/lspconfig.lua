return {
    "neovim/nvim-lspconfig",
    dependencies={
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { 'pyright', 'pyflakes', 'lua_ls', 'clangd', 'clojure-lsp' },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {}
                end,
                ["lua_ls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end
            }
        })
    end
}

