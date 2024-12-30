return {
    "folke/lazydev.nvim",
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            { path = "LazyVim", words = { "LazyVim" } },
            { path = "snacks.nvim", words = { "Snacks" } },
            { path = "lazy.nvim", words = { "LazyVim" } },
            { path = "/usr/local/lib/luarocks/rocks-5.1/http/0.4-0/", words = { "http" } },
        },
    },
}
