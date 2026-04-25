return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    branch = "master",
    opts = {
        ensure_installed = {
            "lua", "vim", "vimdoc",
            "python", "c", "cpp", "rust",
            "bash", "json", "yaml", "markdown",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
