return {
    'saghen/blink.cmp',
    dependencies = {
        "neovim/nvim-lspconfig",
        { "mason-org/mason.nvim", opts = {} },
        { "mason-org/mason-lspconfig.nvim", opts = {} },
    },
    version = '1.*',
    opts = {
    -- C-y: to accept
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    keymap = { preset = 'super-tab' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = { documentation = { auto_show = false } },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },

    signature = {
        enabled = true,
    },
  },
  opts_extend = { "sources.default" },
  config = function (_, opts)
    require("blink.cmp").setup(opts)

    vim.diagnostic.config({
        virtual_lines = { current_line = true },  -- nur für die Cursor-Zeile
        signs = true,
        underline = true,
        update_in_insert = false,   -- nicht während des Tippens neu rechnen
        severity_sort = true,
    })
  end
}
