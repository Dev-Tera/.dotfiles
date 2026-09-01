-- Usage:
-- Completion (Language Server): MasonInstall
-- Syntax Highlighting: TSInstall
return {
    'saghen/blink.cmp',
    dependencies = {
        "neovim/nvim-lspconfig",
        { "mason-org/mason.nvim", opts = {} },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = { automatic_enable = { exclude = { "ts_ls" } } },
        },
    },

    version = '1.*',
    opts = {
        keymap = { preset = 'super-tab' },
        appearance = { nerd_font_variant = 'mono' },
        completion = { documentation = { auto_show = false } },
        sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },
        fuzzy = { implementation = "prefer_rust_with_warning" },
        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },

    config = function(_, opts)
        require("blink.cmp").setup(opts)

        vim.diagnostic.config({
            virtual_text = { current_line = true },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                border = "rounded",
                source = "if_many",
                header = "",
                max_width = 80,
            }, 
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                vim.keymap.set("n", "gd", vim.lsp.buf.definition,
                    { buffer = args.buf, desc = "LSP goto definition" })
                vim.keymap.set("n", "grr", require("telescope.builtin").lsp_references,
                    { buffer = args.buf, desc = "LSP references (Telescope)" })
            end,
        })

        vim.lsp.enable("tsc")
    end,
}
