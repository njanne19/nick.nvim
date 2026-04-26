return {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local colors = { "#FF6B6B", "#FF9F45", "#FFD93D", "#6BCB77", "#4D96FF", "#C77DFF" }
        for i, color in ipairs(colors) do
            vim.api.nvim_set_hl(0, "DashboardRainbow" .. i, { fg = color })
        end

        local header = {
            "",
            "",
            [[    ____               _   _     ____         ____     U  ___ u  _   _     ____   ]],
            [[ U | __")u    ___     | \ |"| U /"___|u    U | __")u    \/"_ \/ | \ |"| U /"___|u ]],
            [[  \|  _ \/   |_"_|   <|  \| |>\| |  _ /     \|  _ \/    | | | |<|  \| |>\| |  _ / ]],
            [[   | |_) |    | |    U| |\  |u | |_| |       | |_) |.-,_| |_| |U| |\  |u | |_| |  ]],
            [[   |____/   U/| |\u   |_| \_|   \____|       |____/  \_)-\___/  |_| \_|   \____|  ]],
            [[  _|| \\_.-,_|___|_,-.||   \\,-._)(|_       _|| \\_       \\    ||   \\,-._)(|_   ]],
            [[ (__) (__)\_)-' '-(_/ (_")  (_/(__)__)     (__) (__)     (__)   (_")  (_/(__)__)  ]],
            "",
        }

        -- Build a set of non-empty header lines for fast lookup
        local header_set = {}
        for _, line in ipairs(header) do
            if line ~= "" then
                header_set[line] = true
            end
        end

        require("dashboard").setup({
            theme = "hyper",
            config = {
                header = header,
                shortcut = {
                    {
                        icon = "󰊳 ",
                        desc = "Update",
                        group = "Label",
                        action = "Lazy update",
                        key = "u",
                    },
                    {
                        icon = " ",
                        desc = "Find File",
                        group = "DiagnosticHint",
                        action = "Telescope find_files",
                        key = "f",
                    },
                    {
                        icon = " ",
                        desc = "Grep",
                        group = "DiagnosticWarn",
                        action = "Telescope live_grep",
                        key = "g",
                    },
                    {
                        icon = " ",
                        desc = "Config",
                        group = "Number",
                        action = "e ~/.config/nvim/init.lua",
                        key = "c",
                    },
                    {
                        icon = "󰗼 ",
                        desc = "Quit",
                        group = "DiagnosticError",
                        action = "qa",
                        key = "q",
                    },
                },
                project = { enable = true, limit = 5 },
                mru = { limit = 5 },
                footer = function()
                    local stats = require("lazy").stats()
                    return {
                        "",
                        "⚡ " .. stats.loaded .. "/" .. stats.count .. " plugins loaded",
                    }
                end,
            },
        })

        local ns = vim.api.nvim_create_namespace("dashboard_rainbow")

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "dashboard",
            callback = function(ev)
                vim.schedule(function()
                    local lines = vim.api.nvim_buf_get_lines(ev.buf, 0, -1, false)
                    local color_idx = 1
                    for i, line in ipairs(lines) do
                        if header_set[line] then
                            vim.api.nvim_buf_set_extmark(ev.buf, ns, i - 1, 0, {
                                line_hl_group = "DashboardRainbow" .. color_idx,
                                priority = 1000,
                            })
                            color_idx = (color_idx % #colors) + 1
                        end
                    end
                end)
            end,
        })
    end,
}
