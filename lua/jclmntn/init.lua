require("jclmntn.set")
require("jclmntn.remap")
require("jclmntn.lazy")

local augroup = vim.api.nvim_create_augroup
local jclmntngroup = augroup('jclmntn', {})
local autocmd = vim.api.nvim_create_autocmd

--AutoCommands
autocmd("LspAttach", {
    group = jclmntngroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.definition() end, opts)
    end
})
