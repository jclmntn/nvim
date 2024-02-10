return {
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
    }
}
