return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-bibtex.nvim"
        },
        config = function()
            local telescope = require("telescope")
            telescope.load_extension("bibtex")
            telescope.setup()
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
