return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter",
    branch = "main",
    opts = {
        ensure_installed = {
            "lua", "vim", "vimdoc",
            "python", "c", "cpp", "rust",
            "bash", "json", "yaml", "markdown",
            "javascript", "typescript", "tsx",
            "flatbuffers",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },
}
