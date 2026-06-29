vim.opt.clipboard = "unnamedplus"

vim.opt.relativenumber = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "Normal", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#9aa0b5", bg = "NONE" })
        vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { fg = "#7aa2f7" })
        vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { fg = "#e5c07b" })
    end,
})
vim.cmd("colorscheme slate")
