-- lsp-config.lua
--
return {
  {
    "dundalek/lazy-lsp.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      { "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig();

      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings to learn the available actions
        lsp_zero.default_keymaps({
          buffer = bufnr,
          preserve_mappings = false,
        })
      end)

      require("lazy-lsp").setup({
        -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
        excluded_servers = {
          "denols",        -- prefer eslint and tssserver
          "quick_lint_js", -- prefer eslint and tssserver
          "tailwindcss",   -- associates with too many filetypes
          "sourcekit",     -- not sure if this is necessary
          "clangd",        -- prefer ccls for now
          -- "ccls",          -- prefer clangd for now
          "marksman",      -- no LS for markdown
          "ltex",          -- no LS for markdown
          "tsserver",     -- prefer vtsls
          -- "vtsls",          -- prefer tsserver
        },
        -- Alternatively specify preferred servers for a filetype (others will be ignored).
        -- preferred_servers = {
        --   markdown = {},
        --   python = { "pyright", "ruff_lsp" },
        -- },
        prefer_local = false, -- Prefer locally installed servers over nix-shell
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- make sure mason installs the server
      servers = {
        tsserver = {
          enabled = false
        },
        vtsls = {
          enabled = true,
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              }
            }
          }
        }
      }
    }
  },
  { "mason-lspconfig.nvim", enabled = false },
  { "mason.nvim",           enabled = false },
}

-- return {
--   {
--     "VonHeikemen/lsp-zero.nvim",
--     branch = "v3.x",
--     dependencies = {
--       -- LSP Support
--       { "neovim/nvim-lspconfig" }, -- Required
--       { "williamboman/mason.nvim" }, -- Optional
--       { "williamboman/mason-lspconfig.nvim" }, -- Optional
--
--       -- Autocompletion
--       { "hrsh7th/nvim-cmp" }, -- Required
--       { "hrsh7th/cmp-nvim-lsp" }, -- Required
--       { "hrsh7th/cmp-buffer" }, -- Optional
--       { "hrsh7th/cmp-path" }, -- Optional
--       { "saadparwaiz1/cmp_luasnip" }, -- Optional
--       { "hrsh7th/cmp-nvim-lua" }, -- Optional
--
--       -- Snippets
--       { "L3MON4D3/LuaSnip" }, -- Required
--       { "rafamadriz/friendly-snippets" }, -- Optional
--     },
--     -- opts = function(_, opts)
--     -- Learn the keybindings, see :help lsp-zero-keybindings
--     -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
--     -- local lsp = require("lsp-zero")
--     -- lsp.preset("recommended")
--
--     -- (Optional) Configure lua language server for neovim
--     -- lsp.nvim_workspace()
--
--     -- lsp.setup()
--     -- end,
--     config = function(_, opts)
--       -- Learn the keybindings, see :help lsp-zero-keybindings
--       -- Learn to configure LSP servers, see :help lsp-zero-api-showcase
--       local lsp = require("lsp-zero")
--       lsp.extend_lspconfig()
--
--       lsp.on_attach(function(client, bufnr)
--         lsp.default_keymaps({ buffer = bufnr })
--       end)
--
--       -- lsp.setup()
--       -- -- to learn how to use mason.nvim
--       -- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
--       require("mason").setup({})
--       require("mason-lspconfig").setup({
--         -- Replace the language servers listed here
--         -- with the ones you want to install
--         ensure_installed = { "tsserver", "eslint" },
--         handlers = {
--           function(server_name)
--             require("lspconfig")[server_name].setup({})
--           end,
--         },
--       })
--     end,
--   },
-- }
