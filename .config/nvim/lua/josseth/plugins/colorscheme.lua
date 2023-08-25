return {
    {
    "catppuccin/nvim",
    priority = 1000, -- make sure to load this before all of the other plugins
    config = function()
        -- load colorscheme here
        vim.cmd([[colorscheme catppuccin-latte]])
    end,
    }
}
