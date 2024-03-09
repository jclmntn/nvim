return{
    {
        "jpalardy/vim-slime",
        init = function()
            vim.g.slime_target = "neovim"
            vim.g.slime_python_ipython = 0
            vim.g.slime_dispatch_ipython_pause = 100
        end
    }
}

