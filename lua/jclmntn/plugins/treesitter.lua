return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "vimdoc", "lua", "python", "r", "clojure", "sql", "markdown", "markdown_inline" },
                highlight = { enable = true },
                indent = { enable = true }
            })
        end
    }
}
