require("jclmntn")
print("hello")

vim.api.nvim_exec('language en_US', true)

-- Lazy Nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Packages
require("lazy").setup(
    {
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            init = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
            end,
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {"nvim-lua/plenary.nvim"},
            config = function()
                require("telescope").setup()
                builtin = require('telescope.builtin')
            end,
            keys = {
                {
                    "<leader>.",
                    function()
                        builtin.find_files()
                    end
                },
                {
                    "<C-p>",
                    function()
                        builtin.git_files()
                    end
                },
                {
                    "<leader>/",
                    function()
                        builtin.grep_string({ search = vim.fn.input("Grep > ")})
                    end
                }
            }
        },
        {
            "rose-pine/nvim",
            name = "rose-pine",
            config = function()
                vim.cmd("colorscheme rose-pine")
                vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    ensure_installed = { "c", "vimdoc", "lua", "python", "r", "clojure", "sql" },
                    highlight = { enable = true },
                    indent = { enable = true }
                })
            end
        },
        {
            "theprimeagen/harpoon",
            config = function()
                mark = require("harpoon.mark")
                ui = require("harpoon.ui")
            end,
            keys = {
                {
                    "<leader>a",
                    function()
                        mark.add_file()
                    end
                },
                {
                    "<C-e>",
                    function()
                        ui.toggle_quick_menu()
                    end
                },
                {
                    "<C-h>",
                    function()
                        ui.nav_file(1)
                    end
                },
                {
                    "<C-t>",
                    function()
                        ui.nav_file(2)
                    end
                },
                {
                    "<C-n>",
                    function()
                        ui.nav_file(3)
                    end
                },
                {
                    "<C-s>",
                    function()
                        ui.nav_file(4)
                    end
                },
            }
        },
        {
            "mbbill/undotree",
            keys = {
                {
                    '<leader>u',
                    vim.cmd.UndotreeToggle
                }
            }
        },
        {
            "tpope/vim-fugitive",
            keys = {
                {
                    '<leader>gs',
                    vim.cmd.Git
                }
            }
        },
        {
            "neovim/nvim-lspconfig",
            dependencies={
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/nvim-cmp",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip"
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

                local cmp = require('cmp')
                cmp.setup({
                    snippet = {
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body)
                        end
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                        ['<C-Space>'] = cmp.mapping.complete()
                    }),
                    sources = cmp.config.sources({
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' }
                    }, {
                            { name = 'buffer' }
                        })
                })
            end
        }
    }
)

