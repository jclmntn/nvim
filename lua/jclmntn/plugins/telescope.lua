return {
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
    }
}
